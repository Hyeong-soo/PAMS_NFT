import 'package:flutter/material.dart';

class MyApp extends StatelessWidget
{
  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context)
  {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __)
        {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: Colors.white,
            ),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: actinfo(),
            debugShowCheckedModeBanner: false,
          );
        }
    );
  }
}


class actinfo extends StatefulWidget {
  @override
  _actinfoState createState() => _actinfoState();
}

class _actinfoState extends State<actinfo> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0, //버튼 - default 옵션으로 pop하게
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.center,
              end: Alignment.bottomRight,
              colors: const <Color>[
                Color.fromRGBO(205, 0, 81, 0.6),
                Color.fromRGBO(205, 0, 81, 0.8),
              ],
            ),
          ),
        ),
        title: Text(
          'PAM+NET',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Spoqa-Medium',
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              MyApp.themeNotifier.value =
              MyApp.themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
            },
            icon: Icon(
              MyApp.themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        //child:Expanded(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Container(
                  height: 26 * Factor_Height,
                ),
                Container(
                  // # 진행중  #공모전/대회
                  height: 30 * Factor_Height,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: Factor_Width * 33
                      ),
                      Text(
                        '#진행중 #공모전/경진대회',
                        style: TextStyle(
                          fontSize: 25.5 * Factor_Height,
                          fontFamily: 'Spoqa-Bold',
                          color: Color(0xFF3C3C3C),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 17 * Factor_Height,
                ),
                Container(
                  //활동 사진 들어갈 곳
                  height: 254 * Factor_Height,
                  child: Image.asset(
                    'assets/actlogo.png',
                    height: 254 * Factor_Height,
                    width: 396 * Factor_Height,
                  ),
                ),
                Container(
                  height: 30 * Factor_Height,
                ),
                Container(
                  height: 80 * Factor_Height,
                  child: Text(
                    '2022 UGRP 학부생\n연구 프로그램',
                    style: TextStyle(
                      fontSize: 32 * Factor_Height,
                      fontFamily: 'Spoqa-Bold',
                      color: Color(0xFF3C3C3C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 34 * Factor_Height,
                ),
                Container(
                  height: 83 * Factor_Height, //"신청 기간"
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
                                '신청 기간',
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
                                '2022-11-07 ~ 2022-12-02',
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
                          child:
                              Divider(color: Color(0XFFCFCFCF), indent: 28, endIndent: 28, thickness: 2.0))
                      ,
                    ],
                  ),
                ),
                Container(
                  height: 40 * Factor_Height,
                ),
                Container(
                  height: 83 * Factor_Height, //"활동 기간"
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
                                '활동 기간',
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
                                '2022-11-07 ~ 2022-12-04',
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
                          child:
                          Divider(color: Color(0XFFCFCFCF), indent: 28, endIndent: 28, thickness: 2.0))
                    ],
                  ),
                ),
                Container(
                  height: 40 * Factor_Height,
                ),
                Container(
                  height: 83 * Factor_Height, //"참여 학년"
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
                                '참여 학년',
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
                                '전 학년',
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
                          child:
                          Divider(color: Color(0XFFCFCFCF), indent: 28, endIndent: 28, thickness: 2.0))
                    ],
                  ),
                ),
                Container(
                  height: 40 * Factor_Height,
                ),
                Container(
                  height: 83 * Factor_Height, //활동기간, 연락처 등 그룹으로 구현, row 필요
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
                                '담당자',
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
                                '이나라',
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
                          child:
                          Divider(color: Color(0XFFCFCFCF), indent: 28, endIndent: 28, thickness: 2.0))
                    ],
                  ),
                ),
                Container(
                  height: 40 * Factor_Height,
                ),
                Container(
                  height: 83 * Factor_Height, //"연락처"
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
                                '연락처',
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
                                '054-279-9002',
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
                          child:
                          Divider(color: Color(0XFFCFCFCF), indent: 28, endIndent: 28, thickness: 2.0))
                    ],
                  ),
                ),
                Container(
                  height: 40 * Factor_Height,
                ),
                Container(
                  height: 83 * Factor_Height, //"이메일"
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
                                '이메일',
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
                                'everydaynara@postech.ac.kr',
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
                          child:
                          Divider(color: Color(0XFFCFCFCF), indent: 28, endIndent: 28, thickness: 2.0))
                    ],
                  ),
                ),
                Container(
                  height: 33 * Factor_Height,
                ),
                Container(
                  // '신청하기' 버튼
                  height: 53 * Factor_Height,
                  child: Container(
                    width: 300 * Factor_Width,
                    child: GestureDetector(
                      onTap: () {
                        // 누르면 신청하는 페이지로 넘어가게
                      },
                      child: Stack(
                        children: [
                          Center(
                            child: Opacity(
                              opacity: 0.73,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFCD0051),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: 300 * Factor_Width,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '신청하기',
                              style: TextStyle(
                                fontSize: 17 * Factor_Width,
                                fontFamily: 'Spoqa-Bold',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 33 * Factor_Height,
                ),
              ],
            ),
          ],
        ),
      ),

    //  ),
    );
  }
}
