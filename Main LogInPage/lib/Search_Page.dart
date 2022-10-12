import 'package:flutter/material.dart';

class Search_Page extends StatefulWidget {
  @override
  State<Search_Page> createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search Page\nComing Soon...',
        style: TextStyle(
          fontSize: 40,
          fontFamily: 'Spoqa-Bold',
        ),
      ),
    );
  }
}
