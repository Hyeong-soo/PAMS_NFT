import 'package:flutter/material.dart';
import 'MainPage.dart';

class  LogInTabs extends StatefulWidget {
  LogInTabs({this.onTabChanged});
  final Function(int)? onTabChanged;

  @override
  _LogInTabsState createState() => _LogInTabsState();
}

class _LogInTabsState extends State<LogInTabs> {
  int _selectedTab = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab *= 2;
            if(_selectedTab >= 4)
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              }
            widget.onTabChanged!(_selectedTab);
            print(_selectedTab);
          });
        },
        child: tabButton(
          _selectedTab == 1 ? "Next Page" : "Finish",
          _selectedTab == 1 ? true : false,
        ),
      ),
    );
  }

  Widget tabButton(String text, bool selected)
  {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      curve: Curves.fastLinearToSlowEaseIn,
      width: 320,
      height: 54,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFCD0051),
        //color: Color(0xFFCD0051).withAlpha(selected ? 20 : 0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text ?? "Button",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
