// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol"; //ERC721 상속 받아 tokenId 에 uri 맵핑 추가한 lib
import "@openzeppelin/contracts/utils/Counters.sol";

contract PamPlNet is ERC721URIStorage, Ownable {

    //owner() pubilc view : 관리자 address 반환 (Ownable.sol)
	//_owner private: 관리자 address (Ownable.sol)
	//onlyOwner modifier : 관리자 address 만 접근가능 (Ownable.sol)

	//ownerOf(uint32 tokenId) pubilc view: token_id to owner mapping (ERC721)
	//balanceOf(address Owner) public view: Owner의 nft 개수 return (ERC721)
	
	using Counters for Counters.Counter;

	Counters.Counter totalCount; //발행된 총 NFT 개수

	constructor() ERC721("PamPlNet", "PPN") {}

	struct tokenInfo {
		string name;
		uint256 generateTime; //nft 생성 시간
		uint32 pamPoint; 
		uint8 kind; //활동이 어떤 종류인지 (예: 1: 동아리 ,2: 대회, 3: 학과, 4: 밈 토큰 등등)
		bool saleable; //판매 가능 여부
	}

	tokenInfo[] public tokens; //Token 배열

	//dev@ 토큰 생성
	function _createToken(
        string memory _name,
        uint32 _pamPoint,
        uint8 _kind,
		bool _saleable
		) private onlyOwner {
		tokens.push( tokenInfo( _name, block.timestamp, _pamPoint, _kind, _saleable));
	}


	//dev@ 학생 리스트를 받아 단체로 토큰 생성 및 민팅(동아리, 학과, 단체 전용 함수)
	function mintTeamToken(
        string memory _name,
        uint32 _pamPoint,
        uint8 _kind,
		bool _saleable,
		string memory tokenURI,
        address[] memory _studentList
        ) public onlyOwner {

		for( uint32 i = 0; i< _studentList.length ; i++ )
		{	
			_createToken( _name, _pamPoint, _kind, _saleable ); //tokens 배열에 정보 추가
			_mint( _studentList[i] , totalCount.current() ); //토큰 id와 address mapping
			_setTokenURI( totalCount.current(), tokenURI); //토큰 id와 URI mapping
			totalCount.increment();
		}
    }

	//dev@ 개인 토큰을 생성하는 함수
	function mintToken(
		string memory _name,
		uint32 _pamPoint,
		uint8 _kind,
		bool _saleable,
		address _owner,
		string memory tokenURI) public onlyOwner
	{
		_createToken(_name, _pamPoint, _kind, _saleable );
		_mint( _owner , totalCount.current() );
		_setTokenURI( totalCount.current() , tokenURI);
		totalCount.increment();
	}

	//dev@ 발행된 총 NFT 개수 반환
	function getTotalCount() external view returns(uint256) {
		return totalCount.current(); 
	}

	//dev@ Token 배열 반환
	function getTokenList() public view returns(tokenInfo[] memory) {
        return tokens;
    }
	
	//dev@ address가 소유한 token들의 id 리스트 반환
	function getTokensbyOwner(address _owner) public view returns(uint32[] memory) {
		require( balanceOf(_owner) != 0, "Owner did not have token.");
		
		uint cnt =0;
		uint32[] memory idList = new uint32[]( balanceOf(_owner) );
		for(uint32 i =0 ; i< totalCount.current(); i++){
			if( ownerOf(i) == _owner ) {
				idList[cnt++] = i;
			}
		}
		return idList;
	}

	//dev@ address가 가진 nft들의 pamPoint 총합 반환 
	function getTotalPoint(address _owner) external view returns( uint32 totalPoint) {

		uint32[] memory idList = getTokensbyOwner(_owner);
		for( uint32 i =0 ; i< balanceOf(_owner) ; i++ ){
			totalPoint += tokens[ idList[i] ].pamPoint;
		}

		return totalPoint;
	}


	
	/*
	여기서부턴 판매 관련 함수들
	*/

	Counters.Counter marketCount;
	mapping(uint256 => uint256) public tokenPrice;

	modifier onlyTokenOwner( uint tokenId ){
		require( ownerOf(tokenId) == msg.sender , "You are not Token Owner!" );
		_;
	}

 	//dev@ 판매할 NFT를 마켓에 올리는 함수
    function putOnMarket(uint256 _tokenId, uint256 _price) public onlyTokenOwner(_tokenId)
    {
		require(tokens[_tokenId].saleable == true, "This token can't sell");
        require(_price > 0, "Price is zero or lower.");
        require(tokenPrice[_tokenId] == 0, "This NFT is already on sale.");
        //require(isApprovedForAll(TokenOwner, address(this)), "NFT owner did not approve token.");

        tokenPrice[_tokenId] = _price;
		marketCount.increment();
    }

	//dev@ 마켓에 올린 NFT 판매 취소 함수
	function putDownMarket(uint256 _tokenId) public onlyTokenOwner(_tokenId)
    {
		require(tokenPrice[_tokenId] != 0, "This NFT is not saling.");
		
        tokenPrice[_tokenId] = 0;
		marketCount.decrement();
    }

	//dev@ 마켓에서 판매 중인 NFT 구매 함수 
	function buyToken(uint256 _tokenId) public payable
    {
        uint256 price = tokenPrice[_tokenId];
        address tokenOwner = ownerOf(_tokenId);

        require(price > 0, "This nft token is not saling.");
        require(price  <= msg.value, "caller sent lower than price.");
        require( tokenOwner != msg.sender,"caller is nft token owner.");

        bool sent = payable(tokenOwner).send(msg.value);
		require(sent, "Failed to send either!");

        _transfer( tokenOwner, msg.sender, _tokenId);

        tokenPrice[_tokenId] = 0;  //판매 리스트에서 삭제
		marketCount.decrement();
    }

    //dev@ 현제 판매중인 NFT들의 Id 리스트를 반환
    function getsaleIdList() view public returns (uint256[] memory )
    {
		uint256[] memory idList = new uint256[]( marketCount.current() );
		uint256 n=0;

        for(uint256 i=0 ; i< totalCount.current() ; i++) {
			if( tokenPrice[i] != 0 ){
				idList[n++] = i;
			}
		}
		return idList;
    }

	//dev@ 토큰의 가격을 반환하는 함수
    function getPrice(uint256 _tokenId) view public returns(uint256)
    {
		require(tokenPrice[_tokenId] != 0, "This NFT is not saling.");
        return tokenPrice[_tokenId];
    }

	//dev@ 토큰 삭제
	function burn(uint256 _tokenId) public onlyTokenOwner(_tokenId)
    {
		require(tokenPrice[_tokenId] == 0, "This NFT is saling.");
        _burn(_tokenId);
    }
}
