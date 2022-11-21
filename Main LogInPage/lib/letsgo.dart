import 'package:flutter/material.dart';
import 'Main_HomePage.dart';

class letsgo extends StatefulWidget{
  @override
  _letsgoState createState() => _letsgoState();
}

class _letsgoState extends State<letsgo>
{
  @override
  Widget build(BuildContext context)
  {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth/standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight/standardDeviceHeight;

    return GestureDetector(
      onTap: ()
      {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container( // 공백
                height: 32 * Factor_Height,
              ),
              Container( // 사진
                height: 223 * Factor_Height,
                width: 312 * Factor_Height,
                child: Image.asset(
                  'assets/letsgo.png',
                  height: 223 * Factor_Height,
                  width: 312 * Factor_Height,
                ),
              ),
              Container( // 공백
                height: 81 * Factor_Height,
              ),
              Container( // '당신의 무한한 가능성을 응원합니다!' 텍스트
                height: 65 * Factor_Height,
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        '당신의 무한한 가능성을',
                        style: TextStyle(
                          fontSize: 30 * Factor_Height,
                          fontFamily: 'Spoqa-Bold',
                          color: Color(0xFFC3C3C3C),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '응원합니다!',
                        style: TextStyle(
                          fontSize: 30 * Factor_Height,
                          fontFamily: 'Spoqa-Bold',
                          color: Color(0xFF3C3C3C),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container( // 공백
                height: 87 * Factor_Height,
              ),
              Container( // '자신을 뽐낼 수 있는 ~ 기원하며' 텍스트
                height: 69 * Factor_Height,
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        '자신을 뽐낼 수 있는 저희 앱에',
                        style: TextStyle(
                          fontSize: 18 * Factor_Height,
                          fontFamily: 'Spoqa-Medium',
                          color: Color(0xFF797979),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '오신 것을 진심으로 환영합니다!',
                        style: TextStyle(
                          fontSize: 18 * Factor_Height,
                          fontFamily: 'Spoqa-Medium',
                          color: Color(0xFF797979),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '앞으로 행복한 일만 일어나길 기원하며',
                        style: TextStyle(
                          fontSize: 18 * Factor_Height,
                          fontFamily: 'Spoqa-Medium',
                          color: Color(0xFF797979),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container( // 공백
                height: 53 * Factor_Height,
              ),
              Container( // '함께 뛰어들어가봅시다!' 버튼
                height: 53 * Factor_Height,
                child: Container(
                  width: 300 * Factor_Width,
                  child: GestureDetector(
                    onTap:()
                    {

                      Navigator.push(
                       context,
                        MaterialPageRoute(builder:
                           (context) => MyApp()),
                      );
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
                            '함께 뛰어들어가봅시다!',
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
                height: 83 * Factor_Height,
              ),
            ] ,
          ),
        ),
      ),
    );

  }
}