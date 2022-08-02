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

	struct extraActToken {  //B-card, exa, Demonect
	
	uint32 tokenID; //nft의 고유성 모든 nft가 달라야한다! -> 명확한 사례와 이용성이 없다면 있을 필요가 있을까?

	string name; //이름

	string summary; //요약
	
	uint32 pamPoint; //점수
	
	string kind; //활동이 어떤 종류인지 (동아리 ,대회, 학과, 비교 활동 등등)

	}
	
	extraActToken[] public tokens; //Token 배열

	function getContractOwner() external view returns(address){ //관리자 address 반환
		return contractOwner;
	}
	
	function _createToken( //토큰 생성
        string memory _name,
        string memory _summary,
        uint32 _pamPoint,
        string memory _kind) private onlyContractOwner {

		tokens.push(extraActToken( totalCount , _name, _summary, _pamPoint, _kind));
	}
	
	function generateTeamToken( //학번 배열을 받아 단체로 토큰 생성
        string memory _name,
        string memory _summary,
        uint32 _pamPoint,
        string memory _kind,
        address[] memory _studentList
        ) public onlyContractOwner {

		for( uint32 i = 0; i< _studentList.length ; i++ )
		{
			_createToken( _name, _summary, _pamPoint, _kind );
			tokenOwner[totalCount ++] = _studentList[i];
			ownerTokenCount[ _studentList[i]] ++;
		}
    }

	function getTotalCount() external view returns(uint32) { //발행된 총 NFT 개수 반환
		return totalCount; 
	}

	function getOwnerTokenCount(address _owner) external view returns(uint32){ //address가 가진 NFT 개수 반환
		return ownerTokenCount[_owner];
	}

	function getTokenList() public view returns(extraActToken[] memory) { //Token 배열 반환
        return tokens;
    }
	
	function getTokensbyOwner(address _owner) public view returns(uint32[] memory) { //address가 소유한 token들의 id 리스트 반환
		uint cnt =0;
		uint32[] memory idList = new uint32[](ownerTokenCount[_owner]);
		for(uint32 i =0 ; i< totalCount; i++){
			if( tokenOwner[i] == _owner ) {
				idList[cnt++] = i;
			}
		}
		return idList;
	}

	function getTotalPoint(address _owner) external view returns( uint32 totalPoint) { //address가 가진 nft들의 pamPoint 총합 반환 

		uint32[] memory idList = getTokensbyOwner(_owner);
		for( uint32 i =0 ; i< ownerTokenCount[_owner] ; i++ ){
			totalPoint += tokens[ idList[i] ].pamPoint;
		}
	}
}