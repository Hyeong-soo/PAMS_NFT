// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol"; //ERC721 상속 받아 tokenId 에 uri 맵핑 추가한 lib
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract PamPlNet is ERC721URIStorage, Ownable{

    //owner() pubilc view : 관리자 address 반환 (Ownable.sol)
	//_owner private: 관리자 address (Ownable.sol)
	//onlyOwner modifier : 관리자 address 만 접근가능 (Ownable.sol)

	//ownerOf(uint32 tokenId) pubilc view: token_id to owner mapping (ERC721)
	//balanceOf(address Owner) public view: Owner의 nft 개수 return (ERC721)
	
    //_setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual: nft의 개수가 고정이 아닐때, baseURI의 방식 대신 사용
    //tokenURI(uint256 tokenId) public view: baseURI와 tokenID를 받아 json 파일의 ipfs 주소의 URI를 읽어온다.


	using Counters for Counters.Counter;

	Counters.Counter totalCount; //발행된 총 NFT 개수

	constructor() ERC721("PamPlNet", "PPN") {}

	struct tokenInfo {
        uint id;
		bool saleable; //판매 가능 여부
	}

	tokenInfo[] public tokens; //Token 배열

	//dev@ 토큰 생성
	function _createToken(
        bool _saleable,
        string memory _tokenURI
		) private onlyOwner {
		
         _setTokenURI( tokens.length , _tokenURI);
        tokens.push( tokenInfo( tokens.length, _saleable) );
	}


    //dev@ 1명에게 1개 민팅
	function mintToken(
        address _owner,
        bool _saleable,
		string memory _tokenURI
		) public onlyOwner
	{
        _mint( _owner , tokens.length);
		_createToken(_saleable, _tokenURI);
		totalCount.increment();
	}

    //dev@ 1명에게 n개 민팅
	function mintTokens(
        address _owner,
        bool _saleable,
		string memory _baseURI,
        uint32 count
		) public onlyOwner
	{
        string memory tokenURI;
        for(uint i=0; i< count; i++)
        {   
            _mint( _owner , tokens.length);

            tokenURI = string(abi.encodePacked( _baseURI, Strings.toString(i) , ".json"));

		    _createToken(_saleable, tokenURI);
		    totalCount.increment();
        }
	}

	//dev@ 학생 리스트를 받아 단체로 토큰 생성 및 민팅(동아리, 학과, 단체 전용 함수)
	function mintTeamToken(
        address[] memory _studentList,
        bool _saleable,
		string memory _baseURI,
        uint32 count
        ) public onlyOwner {
        
        require( _studentList.length == count, "error: count error");
        
        string memory tokenURI;

		for( uint32 i = 0; i< count ; i++ )
		{	
            _mint( _studentList[i] , tokens.length);
            tokenURI = string(abi.encodePacked( _baseURI, Strings.toString(i), ".json"));
		    _createToken( _saleable, tokenURI);
		    totalCount.increment();
		}
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
	function getIdsbyOwner(address _owner) public view returns(uint32[] memory) {
		require( balanceOf(_owner) != 0, "Owner did not have token.");
		
		uint cnt =0;
		uint32[] memory idList = new uint32[]( balanceOf(_owner) );
		for(uint32 i =0 ; i< tokens.length ; i++){
			if( _ownerOf(i) == _owner ) {
				idList[cnt++] = i;
			}
		}
		return idList;
	}

	//dev@ address가 소유한 token 정보 반환
	function getTokensbyOwner(address _owner) public view returns(tokenInfo[] memory) {
		require( balanceOf(_owner) != 0, "Owner did not have token.");
		
		uint cnt =0;
		tokenInfo[] memory tokenList = new tokenInfo[]( balanceOf(_owner) );
		for(uint32 i =0 ; i< tokens.length ; i++){
			if( _ownerOf(i) == _owner ) {
				tokenList[cnt++] = tokens[i];
			}
		}
		return tokenList;
	}

    //dev@ address가 소유한 token들의 id 리스트 반환
	function getURIsbyOwner(address _owner) public view returns(string[] memory) {
		require( balanceOf(_owner) != 0, "Owner did not have token.");
		
		uint cnt =0;
		string[] memory URIList = new string[]( balanceOf(_owner) );
		for(uint32 i =0 ; i< tokens.length ; i++){
			if( _ownerOf(i) == _owner ) {
				URIList[cnt++] = tokenURI(i);
			}
		}
		return URIList;
	}

	function transfer(address _from, address _to, uint _tokenId) public onlyOwner
	{
		_transfer(_from, _to, _tokenId);
	}

	//dev@ address가 가진 nft들의 pamPoint 총합 반환
	/*
	function getTotalPoint(address _owner) external view returns( uint32 totalPoint) {

		uint32[] memory idList = getIdsbyOwner(_owner);
		for( uint32 i =0 ; i< balanceOf(_owner) ; i++ ){
			totalPoint += tokens[ idList[i] ].pamPoint;
		}

		return totalPoint;
	}
	*/

	//@dev tokenURI 변경
	function setTokenURI( uint _tokenId, string memory _tokenURI) public onlyOwner
	{
		_setTokenURI( _tokenId, _tokenURI);
	}

	//dev@ 토큰 삭제
	function burn(uint256 _tokenId) public onlyOwner
    {
		require(tokenPrice[_tokenId] == 0, "This NFT is saling.");
		delete tokens[_tokenId];
		totalCount.decrement();
        _burn(_tokenId);
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
}
