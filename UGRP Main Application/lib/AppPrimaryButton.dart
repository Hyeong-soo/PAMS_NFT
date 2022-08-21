import 'package:flutter/material.dart';

class AppPrimaryButton extends StatefulWidget{
  AppPrimaryButton({this.text ,this.onTabChanged});
  final Function? onTabChanged;
  final String? text;
  _AppPrimaryButtonState createState() => _AppPrimaryButtonState();
}

class _AppPrimaryButtonState extends State<AppPrimaryButton> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap : () {
        setState(() {
          widget.onTabChanged;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 32,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFCD0051),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          widget.text ?? "Primary Button",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
