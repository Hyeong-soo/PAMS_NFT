import 'package:flutter/material.dart';

class Community_Page extends StatefulWidget {
  @override
  State<Community_Page> createState() => _Community_PageState();
}

class _Community_PageState extends State<Community_Page> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Community Page\nComing Soon...',
        style: TextStyle(
          fontSize: 40,
          fontFamily: 'Spoqa-Bold',
        ),
      ),
    );
  }
}
