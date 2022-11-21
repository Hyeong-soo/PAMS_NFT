import 'package:flutter/material.dart';
//import 'LogInFormField.dart';
//import 'AppPrimaryButton.dart';
import 'package:lottie/lottie.dart';

class InformationPage extends StatefulWidget
{
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:30),
        Center(
          child: Lottie.asset(
            'assets/check.json',
            width: 400,
            height: 300,
          ),
        ),
      ],
    );
  }
}
