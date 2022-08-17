import 'package:flutter/material.dart';

class Profile_Page extends StatefulWidget{
  @override
  _Profile_Page_State createState() => _Profile_Page_State();
}

class _Profile_Page_State extends State<Profile_Page>{
  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Text(
        'Profile Page\nComing Soon...',
        style: TextStyle(
          fontSize: 40,
          fontFamily: 'RubikDistressed',
        ),
      ),
    );
  }
}