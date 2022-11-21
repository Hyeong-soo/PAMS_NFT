import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'wallet.dart';

class LogInPage extends StatefulWidget{
  @override
  _LogInPageState createState() => _LogInPageState();
}

class POSTECH_Information
{
  String? ID;
  String? Password;

  POSTECH_Information(this.ID, this.Password);
}

class _LogInPageState extends State<LogInPage>
{
  var _NextController1 = TextEditingController();
  var _NextController2 = TextEditingController();

  @override
  void dispose()
  {
    _NextController1.dispose();
    _NextController2.dispose();
    super.dispose();
  }

  void _add_Information(POSTECH_Information information)
  {
    setState(() {
      FirebaseFirestore.instance.collection('UGRP').add(
        {'ID' : information.ID, 'Password' : information.Password}
      );
      _NextController1.text = '';
      _NextController2.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
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
                height: 50 * Factor_Height,
              ),
              Container(
                height: 205 * Factor_Height,
                width: 312 * Factor_Height,
                child: Image.asset(
                  'assets/LogIn.png',
                  height: 205 * Factor_Height,
                  width: 312 * Factor_Height,
                ),
              ),
              Container(
                height: 45 * Factor_Height,
              ),
              Container(
                height: 39 * Factor_Height,
                child: Text(
                  '환영합니다!',
                  style: TextStyle(
                    fontSize: 32 * Factor_Height,
                    fontFamily: 'Spoqa-Bold',
                    color: Color(0xFF3C3C3C),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 23 * Factor_Height,
              ),
              Container(
                height: 46 * Factor_Height,
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        '본인 확인, 계정 생성을 위해 POVIS',
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
                        'ID와 Password를 작성해주세요!',
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
                height: 69 * Factor_Height,
              ),
              Container(
                height: 32 * Factor_Height,
                child: Row(
                  children: [
                    Container(
                      width: 54 * Factor_Width,
                    ),
                    Container(
                      height: 32 * Factor_Width,
                      width: 32 * Factor_Width,
                      child: Image.asset(
                        'assets/ID.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      width: Factor_Width * 27
                    ),
                    Container(
                      width: 200 * Factor_Width,
                      child: TextField(
                        controller: _NextController1,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFBFBFBF),
                            )
                          ),
                        hintStyle: TextStyle(
                          fontSize: 14.4 * Factor_Width,
                          fontFamily: "Spoqa-Regular",
                          color: Color(0xFF818181),
                        ),
                        hintText: "POVIS ID",
                        ),
                        style: TextStyle(
                          fontSize: 14.4 * Factor_Width,
                          fontFamily: "Spoqa-Regular",
                          color: Color(0xFF3C3C3C),
                        ),
                      ),
                    ),
                    Container(
                      width: 62 * Factor_Width,
                    ),
                  ],
                ),
              ),
              Container(
                height: 34 * Factor_Height,
              ),
              Container(
                height: 32 * Factor_Height,
                child: Row(
                  children: [
                    Container(
                      width: 54 * Factor_Width,
                    ),
                    Container(
                      height: 32 * Factor_Width,
                      width: 32 * Factor_Width,
                      child: Image.asset(
                        'assets/PassWord.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      width: Factor_Width * 27
                    ),
                    Container(
                      width: 200 * Factor_Width,
                      child: TextField(
                        controller: _NextController2,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFBFBFBF),
                              )
                          ),
                          hintStyle: TextStyle(
                            fontSize: 14.4 * Factor_Width,
                            fontFamily: "Spoqa-Regular",
                            color: Color(0xFF818181),
                          ),
                          hintText: "POVIS Password",
                        ),
                        style: TextStyle(
                          fontSize: 14.4 * Factor_Width,
                          fontFamily: "Spoqa-Regular",
                          color: Color(0xFF3C3C3C),
                        ),
                      ),
                    ),
                    Container(
                      width: Factor_Width * 62,
                    ),
                  ],
                ),
              ),
              Container(
                height: 69 * Factor_Height,
              ),
              Container(
                height: 53 * Factor_Height,
                child: Container(
                  width: 300 * Factor_Width,
                  child: GestureDetector(
                    onTap:()
                    {
                      _add_Information(POSTECH_Information(_NextController1.text, _NextController2.text));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:
                            (context) => wallet()),
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
                            '계정 생성하기',
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
