import 'package:flutter/material.dart';
import 'LogInFormField.dart';
//import 'AppPrimaryButton.dart';

class LogInForm extends StatefulWidget {
  LogInForm({this.onTabChanged});
  final Function(int)? onTabChanged;
  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 380,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PAMPLENET",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFCD0051),
                    ),
                  ),
                  Text(
                    "Welcome Users !",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFCD0051).withAlpha(120),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                child: Image(
                  image: AssetImage("assets/PAMPLENET_LOGO.png"),
                  width: 75,
                  height: 75,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Write Your Information",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFFCD0051),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          LogInFormField(
            hintText: "NickName...",
          ),
          SizedBox(
            height: 10,
          ),
          LogInFormField(
            hintText: "POVIS ID...",
          ),
          SizedBox(
            height: 10,
          ),
          LogInFormField(
            hintText: "POVIS PassWord...",
          ),
          /*AppPrimaryButton(
            text: "Finish !",
          ),*/
        ],
      ),
    );
  }
}
