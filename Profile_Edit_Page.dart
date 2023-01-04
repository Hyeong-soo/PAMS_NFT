import 'package:flutter/material.dart';
import 'package:tessproject/Profile_Page.dart';
import 'Profile_Page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<String> NFTPathList = [];

class Edit_Profile_NFT extends StatefulWidget {
  @override
  State<Edit_Profile_NFT> createState() => _Edit_Profile_NFTState();
}

class _Edit_Profile_NFTState extends State<Edit_Profile_NFT> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 40 * Factor_Height,
                ),
                Container(
                  child: Text(
                    '프로필 NFT 수정',
                    style: TextStyle(
                      fontSize: 20 * Factor_Height,
                      fontFamily: 'Spoqa-Bold',
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                NFTPathList.isEmpty
                    ? Container(
                        child: Text(
                          'NFT가 존재하지 않습니다.',
                          style: TextStyle(
                            fontSize: 20 * Factor_Height,
                            fontFamily: 'Spoqa-Bold',
                            color: Color(0xFF000000),
                          ),
                        ),
                      )
                    : Container(
                        child: Text(
                          '프로필로 사용할 NFT를 지정해주세요!',
                          style: TextStyle(
                            fontSize: 20 * Factor_Height,
                            fontFamily: 'Spoqa-Bold',
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),

                Container(
                  height: 20 * Factor_Height,
                ),

                for (int i = 0; i < NFTPathList.length; i++)
                  GestureDetector(
                      onTap: () {
                        setState(() {

                          Profile_path = NFTPathList[i]; //imagepath를 현재 NFT로 바꾸기

                        });
                        Navigator.pop(context); // 이전 페이지 (Profile_page)로 pop
                      },
                      child: Container(
                        height: Factor_Height * 100,
                        width: Factor_Width * 100,
                        child: Image.asset(NFTPathList[i]),
                      ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Profile_Edit_Page extends StatefulWidget {
  @override
  State<Profile_Edit_Page> createState() => _Profile_Edit_PageState();
}

class _Profile_Edit_PageState extends State<Profile_Edit_Page> {
  late TextEditingController _controller;
  String? userInfo = '';
  static final storage = FlutterSecureStorage();

  void setNFTList() async {
    NFTPathList.clear();

    userInfo = await storage.read(key: "login");
    URL = userInfo!.split(" ")[1]; //사용자의 정보에 맞는 docs로 이동하기 위해 경로 설정

    var tempNFTlist = await FirebaseFirestore.instance
        .collection('users')
        .doc(URL)
        .collection('NFT')
        .get(); // NFT list 기져오기

    for (int i = 0; i < tempNFTlist.docs.length; i++) {
      // 활동 넣고, 운영 중 / 신청 가능 / 종료된 활동으로 분류하기

      Map<String, dynamic> temp = tempNFTlist.docs[i].data();
      NFTPathList.add(temp['image']); // NFT Path 추가

    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    if (introduce == '') introduce = '한줄소개가 없습니다.';

    setNFTList(); //NFTList에 user가 가진 NFT의 경로 다 가져옴.

    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 40 * Factor_Height,
                ),
                Container(
                  //활동 사진 들어갈 곳
                  height: 254 * Factor_Height,
                  child: Image.asset(
                    'profile_image.png',
                    height: 254 * Factor_Height,
                    width: 296 * Factor_Width,
                  ),
                ),
                Container(
                  height: 10 * Factor_Height,
                ),
                Container(
                  height: 17 * Factor_Height,
                  child: GestureDetector(
                    child: Text(
                      '프로필 NFT 수정',
                      style: TextStyle(
                        fontSize: 15 * Factor_Height,
                        fontFamily: 'Spoqa-Regular',
                        color: Color(0xFF000000),
                      ),
                    ),
                    onTap: () => Edit_Profile_NFT(), // 수정하는 class 불러오기
                  ),
                ),
                Container(
                  height: 20 * Factor_Height,
                ),
                Container(
                  height: 83 * Factor_Height, //"이름"
                  child: Column(
                    children: [
                      Container(
                          height: 28 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                '이름',
                                style: TextStyle(
                                  fontSize: 24.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Bold',
                                  color: Color(0xFF3C3C3C),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          height: 18 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                username!,
                                style: TextStyle(
                                  fontSize: 17.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Regular',
                                  color: Color(0xFFCFCFCF),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          child: Divider(
                              color: Color(0XFFCFCFCF),
                              indent: 28,
                              endIndent: 28,
                              thickness: 2.0)),
                    ],
                  ),
                ),
                Container(
                  height: 83 * Factor_Height, //"닉네임"
                  child: Column(
                    children: [
                      Container(
                          height: 28 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                '닉네임',
                                style: TextStyle(
                                  fontSize: 24.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Bold',
                                  color: Color(0xFF3C3C3C),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          height: 18 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                '@' + NickName!,
                                style: TextStyle(
                                  fontSize: 17.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Regular',
                                  color: Color(0xFFCFCFCF),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          child: Divider(
                              color: Color(0XFFCFCFCF),
                              indent: 28,
                              endIndent: 28,
                              thickness: 2.0)),
                    ],
                  ),
                ),
                Container(
                  height: 83 * Factor_Height, // 학과
                  child: Column(
                    children: [
                      Container(
                          height: 28 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                '학과',
                                style: TextStyle(
                                  fontSize: 24.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Bold',
                                  color: Color(0xFF3C3C3C),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          height: 18 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                major!,
                                style: TextStyle(
                                  fontSize: 17.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Regular',
                                  color: Color(0xFFCFCFCF),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          child: Divider(
                              color: Color(0XFFCFCFCF),
                              indent: 28,
                              endIndent: 28,
                              thickness: 2.0)),
                    ],
                  ),
                ),
                Container(
                  height: 83 * Factor_Height, //"한줄소개"
                  child: Column(
                    children: [
                      Container(
                          height: 28 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                '한줄소개',
                                style: TextStyle(
                                  fontSize: 24.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Bold',
                                  color: Color(0xFF3C3C3C),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          height: 18 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                introduce!,
                                style: TextStyle(
                                  fontSize: 17.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Regular',
                                  color: Color(0xFFCFCFCF),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          child: Divider(
                              color: Color(0XFFCFCFCF),
                              indent: 28,
                              endIndent: 28,
                              thickness: 2.0)),
                    ],
                  ),
                ),
                Container(height: 20 * Factor_Height),
                Container(
                  child: Text(
                    '한줄소개 수정하기',
                    style: TextStyle(
                      fontSize: 15 * Factor_Height,
                      fontFamily: 'Spoqa-Regular',
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                Container(height: 10 * Factor_Height),
                Container(
                  height: 20 * Factor_Height,
                  child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          labelText: '한줄소개 수정',
                          hintText: introduce!, // 원래 한줄소개, 글자를 입력하면 사라짐
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(3)),
                      onChanged: (text) {
                        setState(() {
                          introduce = text; //바뀔 때마다 한줄소개 저장
                        });
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
