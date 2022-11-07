import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_indicator/carousel_indicator.dart';


class Build_First_Class
{
  Image? ImagePath;
  Container? Title;
  Build_First_Class(this.ImagePath, this.Title);
}

class Build_Second_Class
{
  Image? ImagePath;
  Build_Second_Class(this.ImagePath);
}

double? value_height;
double? value_width;

int? _CurrentPage = 0;
int? _CurrentPage_Second = 0;

List<int> _First_index = [0,1,2];

List<int> _Second_index = [0,1,2,3,4];

List<Build_First_Class> First_List = [
  Build_First_Class(
    Image.asset(
      'assets/First_first.png',
      height: 79 * value_width!,
      width: 71.81 * value_width!,
    ),
    Container(
      height: 38 * value_height!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '활동 열심히 참여하셨나요?',
              style: TextStyle(
                fontFamily: 'Spoqa-Regular',
                fontSize: 15 * value_height!,
                color: Colors.white
              ),
            ),
          ),
          Expanded(
            child: Text(
              'NFT까지 받아가세요!',
              style: TextStyle(
                fontFamily: 'Spoqa-Bold',
                fontSize: 15 * value_height!,
                color: Color(0xFFFFF967),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
  Build_First_Class(
    Image.asset(
      'assets/Second_second.png',
      height: 74 * value_width!,
      width: 79 * value_width!,
    ),
    Container(
      height: 38 * value_height!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '특별한 프로필을 위한',
              style: TextStyle(
                fontFamily: 'Spoqa-Regular',
                fontSize: 15 * value_height!,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '이벤트 NFT 선물 대기 중!',
              style: TextStyle(
                fontFamily: 'Spoqa-Bold',
                fontSize: 15 * value_height!,
                color: Color(0xFFFFF967),
              ),
            ),
          ),
        ],
      ),
    )
  ),
  Build_First_Class(
    Image.asset(
      'assets/Third_third.png',
      height: 83 * value_width!,
      width: 60.65 * value_width!,
    ),
    Container(
      height: 38 * value_height!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '내 PAM 점수 몇 점?',
              style: TextStyle(
                fontFamily: 'Spoqa-Regular',
                fontSize: 15 * value_height!,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '나의 활동 기록 시작하기!',
              style: TextStyle(
                fontFamily: 'Spoqa-Bold',
                fontSize: 15 * value_height!,
                color: Color(0xFFFFF967),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
];

List<Build_Second_Class> Second_List = [
  Build_Second_Class(Image.asset('assets/Second_Imagepath_1.png')),
  Build_Second_Class(Image.asset('assets/Second_Imagepath_2.png')),
  Build_Second_Class(Image.asset('assets/Second_Imagepath_3.png')),
  Build_Second_Class(Image.asset('assets/Second_Imagepath_4.png')),
  Build_Second_Class(Image.asset('assets/Second_Imagepath_5.png')),
];

class Home_Page extends StatefulWidget {
  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        _Build_First(),
        _Build_Second(),
        _Build_Third(),
        _Build_Fourth(),
        _Build_Fifth(),
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
    value_height = Factor_Height;
    value_width = Factor_Width;
    return Container(
      height: 120 * Factor_Height,
      width: MediaQuery.of(context).size.width,
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
      child: CarouselSlider(
        options: CarouselOptions(
            height: 140 * Factor_Height,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            autoPlay: true,
            onPageChanged: (e, reason)
            {
              setState(() {
                _CurrentPage = e;
                //print(MediaQuery.of(context).size.width);
              });
            },
          ),

            items: _First_index.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.0 * Factor_Width),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(height: 16 * Factor_Height),
                                First_List[i].Title!,
                                Container(height: 15 * Factor_Height),
                                CarouselIndicator(
                                  count: First_List.length,
                                  index: _CurrentPage,
                                  color: Color.fromRGBO(164, 164, 164, 0.8),
                                  activeColor: Colors.white,
                                  width: 20.0 * Factor_Width,
                                  height: 3 * Factor_Height,
                                ),
                                Container(height: 8 * Factor_Height),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                First_List[i].ImagePath!,
                              ],
                            ),
                          ],
                        ),
                        Container(height: 18 * Factor_Height),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
        ),
    );
  }

  Widget _Build_Second()
  {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth/standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight/standardDeviceHeight;
    return Column(
      children: [
        Container(
          height: 20 * Factor_Height,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 21.0 * Factor_Width),
          height: 40 * Factor_Height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '가장 핫한 활동',
                style: TextStyle(
                  fontFamily: 'Spoqa-Bold',
                  fontSize: 20.0 * Factor_Height,
                ),
              ),
              Container(
                width: 24 * Factor_Height,
                height: 24 * Factor_Height,
                child: Image.asset('assets/Home_Page_Fire.png'),
              ),
              Spacer(),
              Container(
                width: 19 * Factor_Width,
                child: GestureDetector
                  (
                    child: Image.asset('assets/Home_Page_Arrow.png'),
                    onTap: (){

                    },
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 187.5 * Factor_Height,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 187.5 * Factor_Height,
              enlargeCenterPage: true,
              viewportFraction: 0.6,
              autoPlay: false,
              onPageChanged: (e, reason)
              {
                setState(() {
                  _CurrentPage_Second = e;
                });
              },
            ),

            items: _Second_index.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    //margin: EdgeInsets.symmetric(horizontal: 24.0 * Factor_Width),
                    //width: MediaQuery.of(context).size.width,
                    child: Container(
                      child: Second_List[i].ImagePath,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Container(
          height: 15.5 * Factor_Height,
        ),
        Container(
          height: 8 * Factor_Height,
        ),
        Container(
          height: 44 * Factor_Height,
        ),
        Container(
          height: 40 * Factor_Height,
        ),
        Container(
          height: 125 * Factor_Height,
        ),
        Container(
          height: 41 * Factor_Height,
        ),
        Container(
          height: 40 * Factor_Height,
        ),
        Container(
          height: 125 * Factor_Height,
        ),
        Container(
          height: 41 * Factor_Height,
        ),
        Container(
          height: 40 * Factor_Height,
        ),
        Container(
          height: 239 * Factor_Height,
        ),
        Container(
          height: 15.5 * Factor_Height,
        ),
        Container(
          height: 8 * Factor_Height,
        ),
        Container(
          height: 24 * Factor_Height,
        ),
      ],
    );
  }

  Widget _Build_Third()
  {
    return Container();
  }

  Widget _Build_Fourth()
  {
    return Container();
  }

  Widget _Build_Fifth()
  {
    return Container();
  }

}
