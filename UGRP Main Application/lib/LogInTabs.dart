import 'package:flutter/material.dart';

class  LogInTabs extends StatefulWidget {
  LogInTabs({this.onTabChanged});
  final Function(int)? onTabChanged;

  @override
  _LogInTabsState createState() => _LogInTabsState();
}

class _LogInTabsState extends State<LogInTabs> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = _selectedTab == 1 ? 0 : 1;
            widget.onTabChanged!(_selectedTab);
          });
        },
        child: Container(
          margin: const EdgeInsets.all(32),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              tabButton(
                "Naming",
                _selectedTab == 0 ? true : false,
              ),
              tabButton(
                "Information",
                _selectedTab == 0 ? false : true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabButton(String text, bool selected)
  {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      curve: Curves.fastLinearToSlowEaseIn,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFCD0051).withAlpha(selected ? 20 : 0),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Text(
        text ?? "Button",
        style: TextStyle(
          color: selected ? Color(0xFFCD0051) : Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
