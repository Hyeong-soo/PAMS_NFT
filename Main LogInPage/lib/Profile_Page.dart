import 'package:flutter/material.dart';

class Profile_Page extends StatefulWidget {
  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {

  bool is_Third = true;
  bool is_Fourth = true;


  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        _Build_First(),
        _Build_Second(),
        is_Third
          ? _Build_Third()
          : _NFT_Third(),
        is_Fourth
          ? _Build_Fourth()
          : _NFT_Fourth(),
      ],
    );
  }

  Widget _Build_First()
  {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth/standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight/standardDeviceHeight;

    return Stack(
      children: [
        Container(
          height: 203 * Factor_Height,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 145 * Factor_Height,
                    color: Colors.white,
                  ),
                  Container(
                    height: 145 * Factor_Height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: const <Color>[
                          Color.fromRGBO(205, 0, 81, 0.6),
                          Color.fromRGBO(205, 0, 81, 0.8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 57 * Factor_Height,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 11.0 * Factor_Width),
                height: 91 * Factor_Height,
                width: 91 * Factor_Height,
                child: Profile(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Profile()
  {
    return Container(color: Colors.black);
  }

  Widget _Build_Second()
  {
    return Container();
  }
  Widget _Build_Third()
  {
    return Container();
  }
  Widget _Build_Fourth()
  {
    return Container();
  }
  Widget _NFT_Third()
  {
    return Container();
  }
  Widget _NFT_Fourth()
  {
    return Container();
  }
}
