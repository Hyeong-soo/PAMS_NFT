import 'package:flutter/material.dart';
import 'LogInTabs.dart';
import 'LogInForm.dart';
import 'InformationPage.dart';
import 'dart:math'as math;

class LogInPage extends StatefulWidget
{
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> with SingleTickerProviderStateMixin
{
  Animation<double>? _rotationAnimation;
  AnimationController? _animationController;
  bool _isLogInFormActive = true;

  static Matrix4 _pmat(num pv)
  {
    return new Matrix4(
      1.0, 0.0, 0.0, 0.0, //
      0.0, 1.0, 0.0, 0.0, //
      0.0, 0.0, 1.0, pv * 0.001, //
      0.0, 0.0, 0.0, 1.0,
    );
  }

  Matrix4 perspective = _pmat(1.0);

  @override
  void initState()
  {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _StartRotation();
  }

  void _StartRotation()
  {
    _animationController!.reset();

    _rotationAnimation = Tween<double>(
      begin: _isLogInFormActive ? 0 : 180,
      end: _isLogInFormActive ? 180 : 0,
    ).chain(
        CurveTween(curve: Curves.fastLinearToSlowEaseIn),
      )
      .animate(_animationController!)
      ..addListener(() {
        setState(() {

        });
      });
    _animationController!.forward();
  }

  @override
  Widget build(BuildContext context)
  {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFCD0051), Color(0xFF1e1e1e)]
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            pageHeader(),
            Stack(
              children: [
                AnimatedOpacity(
                  opacity: _isLogInFormActive ? 1 : 0,
                  duration: Duration(milliseconds: 600),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: Transform(
                    transform: perspective.scaled(1.0, 1.0, 1.0)
                      ..rotateX(0)
                      ..rotateY(math.pi - _rotationAnimation!.value * math.pi / 180)
                      ..rotateZ(0),
                    alignment: FractionalOffset.center,
                    child: LogInForm(),
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isLogInFormActive ? 0 : 1,
                  duration: Duration(milliseconds: 600),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: Transform(
                    transform: perspective.scaled(1.0, 1.0, 1.0)
                      ..rotateX(0)
                      ..rotateY(math.pi - (180 + _rotationAnimation!.value) * math.pi / 180)
                      ..rotateZ(0),
                    alignment: FractionalOffset.center,
                    child: InformationPage(),
                  ),
                ),
              ]
            ),
            LogInTabs(
              onTabChanged: (value)
                  {
                    _isLogInFormActive = value == 0 ? true : false;
                    _StartRotation();
                  }
            ),
          ]
      ),
    ),
    );
  }

  Widget pageHeader()
  {
    return Container(
      margin: const EdgeInsets.all(32),
      child: Text(
        "Let's Go Create\nYour New Account",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}