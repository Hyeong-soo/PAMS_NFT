import 'package:flutter/material.dart';
import 'package:tessproject/Profile_Page.dart';
import 'Profile_Page.dart';

class Profile_Edit_Page extends StatefulWidget {
  @override
  State<Profile_Edit_Page> createState() => _Profile_Edit_PageState();
}

class _Profile_Edit_PageState extends State<Profile_Edit_Page> {
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    if (introduce == '') introduce = '한줄소개가 없습니다.';

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
                  child: Text(
                    '프로필 NFT 수정',
                    style: TextStyle(
                      fontSize: 15 * Factor_Height,
                      fontFamily: 'Spoqa-Regular',
                      color: Color(0xFF000000),
                    ),
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
                /*
                Container(
                  height: 83 * Factor_Height, //"POVIS ID"
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
                                'POVIS ID',
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
                                'daehyeonchoi',
                                style: TextStyle(
                                  fontSize: 17.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Regular',
                                  color: Color(0xFFCFCFCF),
                                ),
                              ),
                            ],
                          )),

                 */

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
                Container(
                  height: 10 * Factor_Height
                ),
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
                    }

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
