import 'package:flutter/material.dart';

class Services_Page extends StatefulWidget{
  @override
  _Services_Page_State createState() => _Services_Page_State();
}

class _Services_Page_State extends State<Services_Page>{
  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Text(
        'Services Page\nComing Soon...',
        style: TextStyle(
          fontSize: 40,
          fontFamily: 'RubikDistressed',
        ),
      ),
    );
  }
}