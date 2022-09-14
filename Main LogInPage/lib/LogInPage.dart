import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    return GestureDetector(
      onTap: ()
      {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 50,
                child: Container(
                ),
              ),
              Expanded(
                flex: 205,
                child: Container(
                  height: 205,
                  width: 312,
                  child: Image.asset('assets/LogIn.png'),
                ),
              ),
              Expanded(
                flex: 45,
                child: Container(

                ),
              ),
              Expanded(
                flex: 39,
                child: Text(
                  '환영합니다!',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Spoqa-Bold',
                    color: Color(0xFF3C3C3C),
                  ),
                ),
              ),
              Expanded(
                flex: 23,
                child: Container(

                ),
              ),
              Expanded(
                flex: 46,
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        '본인 확인, 계정 생성을 위해 POVIS',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Spoqa-Medium',
                          color: Color(0xFF797979),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'ID와 Password를 작성해주세요!',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Spoqa-Medium',
                          color: Color(0xFF797979),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 69,
                child: Container(

                ),
              ),
              Expanded(
                flex: 32,
                child: Row(
                  children: [
                    Expanded(
                      flex: 54,
                      child: Container(

                      ),
                    ),
                    Expanded(
                      flex: 32,
                      child: Container(
                        height: 32,
                        width: 32,
                        child: Image.asset('assets/ID.png'),
                      ),
                    ),
                    Expanded(
                      flex: 27,
                      child: Container(

                      ),
                    ),
                    Expanded(
                      flex: 200,
                      child: TextField(
                        controller: _NextController1,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFBFBFBF),
                            )
                          ),
                        hintStyle: TextStyle(
                          fontSize: 14.4,
                          fontFamily: "Spoqa-Regular",
                          color: Color(0xFF818181),
                        ),
                        hintText: "POVIS ID",
                        ),
                        style: TextStyle(
                          fontSize: 14.4,
                          fontFamily: "Spoqa-Regular",
                          color: Color(0xFF3C3C3C),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 62,
                      child: Container(

                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 34,
                child: Container(

                ),
              ),
              Expanded(
                flex: 32,
                child: Row(
                  children: [
                    Expanded(
                      flex: 54,
                      child: Container(

                      ),
                    ),
                    Expanded(
                      flex: 32,
                      child: Container(
                        height: 32,
                        width: 32,
                        child: Image.asset('assets/PassWord.png'),
                      ),
                    ),
                    Expanded(
                      flex: 27,
                      child: Container(

                      ),
                    ),
                    Expanded(
                      flex: 200,
                      child: TextField(
                        controller: _NextController2,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFBFBFBF),
                              )
                          ),
                          hintStyle: TextStyle(
                            fontSize: 14.4,
                            fontFamily: "Spoqa-Regular",
                            color: Color(0xFF818181),
                          ),
                          hintText: "POVIS Password",
                        ),
                        style: TextStyle(
                          fontSize: 14.4,
                          fontFamily: "Spoqa-Regular",
                          color: Color(0xFF3C3C3C),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 62,
                      child: Container(

                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 69,
                child: Container(

                ),
              ),
              Expanded(
                flex: 53,
                child: Stack(
                  children: [
                    Center(
                      child: Opacity(
                        opacity: 0.73,
                        child: GestureDetector(
                          onTap:()
                          {
                            _add_Information(POSTECH_Information(_NextController1.text, _NextController2.text));
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder:
                                  (context) => MetaMaskPage()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFCD0051),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            width: 300,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        '계정 생성하기',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Spoqa-Bold',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ] ,
                ),
              ),
            Expanded(
              flex: 83,
              child: Container(

              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}

class MetaMaskPage extends StatefulWidget {
  @override
  _MetaMaskPageState createState() => _MetaMaskPageState();
}

class _MetaMaskPageState extends State<MetaMaskPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}