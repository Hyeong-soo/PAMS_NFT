import 'package:flutter/material.dart';
import 'whoareyou.dart';

class wallet extends StatefulWidget{
  @override
  _walletState createState() => _walletState();
}

class _walletState extends State<wallet>
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
              Container(
                height: 29 * Factor_Height,
              ),
              Container(
                height: 52 * Factor_Height,
              ),
              Container( // 사진
                height: 205 * Factor_Height,
                width: 312 * Factor_Height,
                child: Image.asset(
                  'assets/wallet.png',
                  height: 205 * Factor_Height,
                  width: 312 * Factor_Height,
                ),
              ),
              Container( // 공백
                height: 47 * Factor_Height,
              ),
              Container( // '가상 지갑 연동' 텍스트
                height: 35 * Factor_Height,
                child: Text(
                  '가상 지갑 연동',
                  style: TextStyle(
                    fontSize: 32 * Factor_Height,
                    fontFamily: 'Spoqa-Bold',
                    color: Color(0xFF3C3C3C),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container( // 공백
                height: 19 * Factor_Height,
              ),
              Container(
                height: 46 * Factor_Height,
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        'NFT 서비스를 이용하기 위해서는',
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
                        'NFT를 보관할 지갑이 필요합니다!',
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
                height: 63 * Factor_Height,
              ),
              Container( // 'MetaMask' 버튼
                height: 53 * Factor_Height,
              ),
              Container(
                height: 13 * Factor_Height,
              ),
              Container( // 'MetaMask 지갑이 없다면?' 버튼
                height: 53 * Factor_Height,
              ),
              Container( // 공백
                height: 61 * Factor_Height,
              ),
              Container( // 다음으로 버튼
                height: 53 * Factor_Height,
                child: Container(
                  width: 300 * Factor_Width,
                  child: GestureDetector(
                    onTap:()
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => whoareyou())); // whoareyou 페이지로 넘어감


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
                            '다음으로',
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