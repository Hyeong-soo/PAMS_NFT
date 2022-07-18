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
	mapping (uint32 => address) classNumberToAddress; //학번 to 주소

	struct extraActToken {  //B-card, exa, Demonect
	
	uint32 tokenID; //nft의 고유성 모든 nft가 달라야한다! -> 명확한 사례와 이용성이 없다면 있을 필요가 있을까?

	string name;

	string summary; //요약
	
	uint32 pamPoint; //점수
	
	string kind; //활동이 어떤 종류나 (동아리 ,대회, 학과, 비교 활동 등등)

	}
	
	extraActToken[] public tokens;
	
	//@dev 
	function _createToken(
        string memory _name,
        string memory _summary,
        uint32 _pamPoint,
        string memory _kind) private onlyContractOwner {

		tokens.push(extraActToken( totalCount, _name, _summary, _pamPoint, _kind));
	}
	

	//@dev 
	function generateTeamToken(
        string memory _name,
        string memory _summary,
        uint32 _pamPoint,
        string memory _kind,
        uint32[] memory _studentList
        ) public onlyContractOwner {

		    for( uint i = 0; i< _studentList.length ; i++ )
            {
		        _createToken( _name, _summary, _pamPoint, _kind );
		        tokenOwner[totalCount++] = classNumberToAddress[ _studentList[i] ];
            }
        }
    function getTokenList() public view returns(extraActToken[] memory) {
        return tokens;
    }
}