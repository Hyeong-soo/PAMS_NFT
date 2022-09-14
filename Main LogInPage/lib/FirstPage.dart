import 'package:flutter/material.dart';
import 'LogInPage.dart';

class FirstPage extends StatefulWidget{
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder:
                    (context) => LogInPage()),
              );
            },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 304,
                child: Container(
                )
              ),
              Expanded(
                flex: 140,
                child: Container(
                  height: 140,
                  width: 140,
                  child: Image.asset('assets/LoGo.png'),
                ),
              ),
              Expanded(
                flex: 207,
                child: Container(
                  
                )
              ),
              Expanded(
                flex: 33,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'from',
                        style: TextStyle(
                          fontFamily: 'Spoqa-Medium',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'PAMS POSTECH',
                        style: TextStyle(
                          fontFamily: 'Spoqa-Bold',
                          color: Color(0xFFCD0051),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 99,
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