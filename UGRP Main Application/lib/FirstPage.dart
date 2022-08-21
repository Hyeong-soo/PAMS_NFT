import 'package:flutter/material.dart';
import 'package:hover_effect/hover_effect.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'PAMPLENET',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: 150,
              height: 150,
              child: HoverCard(
                builder: (context, hovering) {
                  return Container(
                    color: Colors.white,
                    child: Center(
                      child: Image.asset('assets/PAMPLENET_LOGO.png'),
                    ),
                  );
                },
                depth: 10,
                depthColor: Colors.grey[500],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (context) => LogInPage()),
                  );
                },
                shadow: BoxShadow(color: Colors.white, blurRadius: 30, spreadRadius: -20, offset: Offset(0, 40)),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'YOU CAN ROTATE!!\nIF YOU TEST ROTATING, PLEASE TAP LOGO',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}