// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract PAMS {

	address contractOwner; //최초 컨트랙트 배포자의 주소 (admin 주소)
	uint32 totalCount; //발행된 총 NFT 개수

	constructor() {  //생성자
		contractOwner = msg.sender;
		totalCount = 0;
	}
	
	modifier onlyContractOwner {
		require(contractOwner == msg.sender);
		_;
	}

	mapping (uint32 => address) tokenOwner; //owner of token_id
	mapping (address => uint32) ownerTokenCount; //address가 가진 token 개수
	mapping (uint32 => address) studentIDtoAddress; //학번 to 해당 학번 학생의 지갑 주소 맵핑
	struct extraActToken {  //B-card, exa, Demonect
	
	uint32 tokenID; //nft의 고유성 모든 nft가 달라야한다! -> 명확한 사례와 이용성이 없다면 있을 필요가 있을까?

	string name; //이름

	string summary; //요약
	
	uint32 pamPoint; //점수
	
	string kind; //활동이 어떤 종류인지 (동아리 ,대회, 학과, 비교 활동 등등)

	string url; //nft의 ipfs 주소

	bool isTradable; //교환이나 판매 가능 여부
	}
	
	extraActToken[] public tokens; //Token 배열

	function getContractOwner() external view returns(address){ //관리자 address 반환
		return contractOwner;
	}
	
	function _createToken( //토큰 생성
        string memory _name,
        string memory _summary,
        uint32 _pamPoint,
        string memory _kind,
		string memory _url) private onlyContractOwner {

		tokens.push(extraActToken( totalCount, _name, _summary, _pamPoint, _kind, _url, false));
	}
	
	function generateTeamToken( //학번 배열을 받아 단체로 토큰 생성
        string memory _name,
        string memory _summary,
        uint32 _pamPoint,
        string memory _kind,
        uint32[] memory _studentList,
		    string memory _url
        ) public onlyContractOwner {

		    for( uint i = 0; i< _studentList.length ; i++ )
            {
		        _createToken( _name, _summary, _pamPoint, _kind, _url );
		        tokenOwner[totalCount++] = studentIDtoAddress[ _studentList[i] ];
            }
        }
    function getTokenList() public view returns(extraActToken[] memory) {
        return tokens;
    }

	function generateRandomNFT(string memory _url) public { //밈 토큰
		tokens.push(extraActToken(totalCount, "POSTECHIAN_MEME_NFT", "This is randomly generated Postechian meme NTF by using some gold.", 0, "POSTECHIAN_MEME_NFT", _url, true));
		tokenOwner[totalCount++] = msg.sender;

	}
}