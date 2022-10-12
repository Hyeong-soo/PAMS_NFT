import 'package:flutter/material.dart';

import 'Home_Page.dart';
import 'Search_Page.dart';
import 'Request_Page.dart';
import 'Request_Information.dart';
import 'Community_Page.dart';
import 'Profile_Page.dart';

class MyApp extends StatelessWidget
{
  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context)
  {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __)
      {
        return MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.white,
          ),
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
          home: Main_HomePage(),
          debugShowCheckedModeBanner: false,
        );
      }
    );
  }
}

class Main_HomePage extends StatefulWidget {

  @override
  State<Main_HomePage> createState() => _Main_HomePageState();
}

class _Main_HomePageState extends State<Main_HomePage> {

  var _index = 0;
  var _pages = [
    Home_Page(),
    Search_Page(),
    Request_Information(),
    Community_Page(),
    Profile_Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {

          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.center,
              end: Alignment.bottomRight,
              colors: const <Color>[
                Color.fromRGBO(205, 0, 81, 0.6),
                Color.fromRGBO(205, 0, 81, 0.8),
              ],
            ),
          ),
        ),
        title: Text(
          'PAM+NET',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Spoqa-Medium',
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              MyApp.themeNotifier.value =
              MyApp.themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
            },
            icon: Icon(
              MyApp.themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Spoqa-Medium',
        ),
        selectedLabelStyle: TextStyle(
          fontFamily: 'Spoqa-Medium',
        ),
        selectedItemColor: Color(0xFFCD0051),
        unselectedItemColor: Color(0xFFC9C9C9),
        onTap: (index)
        {
          setState(() {
            if(index != 2)
              {
                _index = index;
              }
            else
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                      (context) => Request_Page()),
                );
              }
          });
        },
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: '홈',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: '검색',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: '요청',
            icon: Icon(Icons.add_circle),
          ),
          BottomNavigationBarItem(
            label: '커뮤니티',
            icon: Icon(Icons.groups),
          ),
          BottomNavigationBarItem(
            label: '프로필',
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}