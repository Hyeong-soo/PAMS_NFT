import 'package:flutter/material.dart';

class Profile_Page extends StatefulWidget {
  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Page\nComing Soon...',
        style: TextStyle(
          fontSize: 40,
          fontFamily: 'Spoqa-Bold',
        ),
      ),
    );
  }
}
