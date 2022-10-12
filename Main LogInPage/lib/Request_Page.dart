import 'package:flutter/material.dart';
import 'Request_Information.dart';

class Request_Page extends StatefulWidget {
  @override
  State<Request_Page> createState() => _Request_PageState();
}

class _Request_PageState extends State<Request_Page> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth/standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight/standardDeviceHeight;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 48 * Factor_Height,
            ),
            Container(
              height: 290 * Factor_Height,
              width: 290 * Factor_Height,
              child: Image.asset(
                'assets/Request_First.png',
                height: 290 * Factor_Height,
                width: 290 * Factor_Height,
              ),
            ),
            Container(
              height: 73 * Factor_Height,
            ),
            Container(
              height: 30 * Factor_Height,
              child: Text(
                '당신의 NFT를 생성해보세요!!',
                style: TextStyle(
                  fontSize: 25 * Factor_Height,
                  fontFamily: 'Spoqa-Bold',
                  color: Color(0xFF3C3C3C),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 73 * Factor_Height,
            ),
            Container(
              height: 69 * Factor_Height,
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      'NFT를 통해 당신의 활동을 증명함과 동시에',
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
                      '자신이 얼마나 대단한 사람인지',
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
                      '남들에게 보여주세요!',
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
            Container(
              height: 66 * Factor_Height,
            ),
            Container(
              height: 53 * Factor_Height,
              child: Container(
                width: 300 * Factor_Width,
                child: GestureDetector(
                  onTap:()
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:
                          (context) => Request_Information()),
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
                          'NFT 생성하러 가기',
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
    );
  }
}
