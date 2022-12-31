import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'infolist.dart';
import 'actinfo.dart';
import 'package:firebase_core/firebase_core.dart';


class Build_First_Class
{
  Image? ImagePath;
  Container? Title;
  Build_First_Class(this.ImagePath, this.Title);
}

class Build_Second_Class
{
  Image? ImagePath;
  String? path;
  Build_Second_Class(this.ImagePath, this.path);
}

class Build_Fifth_Class
{
  Image? ImagePath;
  Build_Fifth_Class(this.ImagePath);
}

class Heart_Like_Class
{
  String? Heart_Activity_Name;
  int Like_Num = 0;
  bool is_True = false;

  Heart_Like_Class(this.Heart_Activity_Name, this.Like_Num, this.is_True);
}

List<Heart_Like_Class> _Activity_Name = [
  Heart_Like_Class('2022 e-포트폴리오 비교과활동 로드맵 제안 공모전', 0, false),
  Heart_Like_Class('유니티(Unity)를 활용한 실감형 메타버스 콘텐츠 제작', 0, false),
  Heart_Like_Class('[온라인 특강] 엑셀을 활용한 데이터 분석과 시각화', 0, false),
  Heart_Like_Class('온라인 학습전략진단 에세이 작성', 0, false),
  Heart_Like_Class('제 7회 "CCRP 공유 플랫폼" 공모전', 0, false),
  Heart_Like_Class('학습윤리 캠페인 포스터 공모전', 0, false),
  Heart_Like_Class('[학습워크숍] 성격유형에 따른 자기관리 전략', 0, false),
  Heart_Like_Class('책 읽는 포스테키안(2022-4차)', 0, false),
  Heart_Like_Class('2022-2학기 러닝커뮤니티', 0, false),
  Heart_Like_Class('2022 학부생 연구프로그램', 0, false),
];

List<DocumentReference> _Doc_Information = [
  FirebaseFirestore.instance.collection('Activity_Collection').doc('Jle6J0dFDc6IPw9dCn1E'),
  FirebaseFirestore.instance.collection('Activity_Collection').doc('dCyqppqeJS80oagNo1R7'),
  FirebaseFirestore.instance.collection('Activity_Collection').doc('thhOBHNfjyMtq7wi5bfI'),
  FirebaseFirestore.instance.collection('Activity_Collection').doc('cB5FvfgHufOyXAsSTEdR'),
  FirebaseFirestore.instance.collection('Activity_Collection').doc('T30KSWuZccUTRwlwf0ex'),
  FirebaseFirestore.instance.collection('Activity_Collection').doc('Jq3CDZ1suW3MzOqV9UFX'),
  FirebaseFirestore.instance.collection('Activity_Collection').doc('Tj8cT3tZR23AlO5MU3m3'),
  FirebaseFirestore.instance.collection('Activity_Collection').doc('T0fVgwi27SewNXJF8tvA'),
  FirebaseFirestore.instance.collection('Activity_Collection').doc('h9boHngsnRf9CGbT6uZs'),
  FirebaseFirestore.instance.collection('Activity_Collection').doc('NTBLsFAeODa1If9zI56j'),
];

double? value_height;
double? value_width;

int? _CurrentPage = 0;
int? _CurrentPage_Second = 0;
int? _CurrentPage_Fifth = 0;

List<int> _First_index = [0,1,2];

List<int> _Second_index = [0,1,2,3,4];

List<int> _Fifth_index = [0,1,2,3,4];

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
  Build_Second_Class(Image.asset('assets/Second_Imagepath_1.png'), 'assets/Second_Imagepath_1.png'),
  Build_Second_Class(Image.asset('assets/Second_Imagepath_2.png'), 'assets/Second_Imagepath_2.png'),
  Build_Second_Class(Image.asset('assets/Second_Imagepath_3.png'), 'assets/Second_Imagepath_3.png'),
  Build_Second_Class(Image.asset('assets/Second_Imagepath_4.png'), 'assets/Second_Imagepath_4.png'),
  Build_Second_Class(Image.asset('assets/Second_Imagepath_5.png'), 'assets/Second_Imagepath_5.png'),
];

List<Build_Fifth_Class> Fifth_List = [
  Build_Fifth_Class(Image.asset('assets/NFT_1.png')),
  Build_Fifth_Class(Image.asset('assets/NFT_2.png')),
  Build_Fifth_Class(Image.asset('assets/NFT_3.png')),
  Build_Fifth_Class(Image.asset('assets/NFT_4.png')),
  Build_Fifth_Class(Image.asset('assets/NFT_5.png')),
];



class Home_Page extends StatefulWidget {
  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {

  void _add_Heart_Num(Heart_Like_Class heart_like_class, DocumentReference doc)
  {
    if(heart_like_class.is_True == true)
    {
      heart_like_class.Like_Num -= 1;
      heart_like_class.is_True = false;
    }
    else
    {
      heart_like_class.Like_Num += 1;
      heart_like_class.is_True = true;
    }
    FirebaseFirestore.instance.collection('Activity_Collection').doc(doc.id).update(
        {
          'Like_Num' : heart_like_class.Like_Num,
          'is_True' : heart_like_class.is_True,
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _Build_First(),
          _Build_Second(),
          _Build_Third(),
          _Build_Fourth(),
          _Build_Fifth(),
        ],
      ),
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
    return Stack(
      children: [
        Container(
          color:Colors.white,
          height: 120 * Factor_Height,
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          height: 120 * Factor_Height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
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
        ),
      ],
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
              viewportFraction: 0.55,
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
                    child: GestureDetector( //프로필 편집 버튼
                      onTap: () {
                        imagetoactinfo(Second_List[i].path!);
                      },
                      child: Container(
                        height: 30 * Factor_Height,
                        margin: EdgeInsets.symmetric(horizontal: 18.0 * Factor_Width),
                        child: Container(
                          child: Second_List[i].ImagePath,
                          ),
                        ),
                      ),
                    );
                },
              );
            }).toList(),
          ),
        ),
        Container(
          height: 20 * Factor_Height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CarouselIndicator(
                count: Second_List.length,
                index: _CurrentPage_Second,
                color: Color.fromRGBO(164, 164, 164, 0.8),
                activeColor: Colors.black,
                width: 20.0 * Factor_Width,
                height: 4.0 * Factor_Height,
              ),
            ],
          ),
        ),
        Container(
          height: 44 * Factor_Height,
        ),
      ],
    );
  }

  Widget _Build_Third()
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
          margin: EdgeInsets.symmetric(horizontal: 21.0 * Factor_Width),
          height: 40 * Factor_Height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PAMS 비교과 활동 ',
                style: TextStyle(
                  fontFamily: 'Spoqa-Bold',
                  fontSize: 20.0 * Factor_Height,
                ),
              ),
              Container(
                width: 24 * Factor_Height,
                height: 24 * Factor_Height,
                child: Image.asset('assets/Home_Page_PAMS_Activity.png'),
              ),
              Spacer(),
              Container(
                width: 19 * Factor_Width,
                child: GestureDetector
                  (
                  child: Image.asset('assets/Home_Page_Arrow.png'),
                  onTap: (){
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(builder:
                            (context) => infolisttabbar()));
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 130 * Factor_Height,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 13 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[0], _Doc_Information[0]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_1.png',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[0].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[0].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[0], _Doc_Information[0]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[0].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // First
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[1], _Doc_Information[1]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_2.jpg',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[1].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[1].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[1], _Doc_Information[1]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[1].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // Second
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[2], _Doc_Information[2]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_3.png',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[2].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[2].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[2], _Doc_Information[2]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[2].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // Third
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[3], _Doc_Information[3]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_4.png',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[3].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[3].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[3], _Doc_Information[3]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[3].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // Fourth
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[4], _Doc_Information[4]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_5.jpg',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[4].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[4].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[4], _Doc_Information[4]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[4].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // Fifth
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[5], _Doc_Information[5]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_6.png',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[5].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[5].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[5], _Doc_Information[5]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[5].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // Sixth
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[6], _Doc_Information[6]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_7.png',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[6].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[6].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[6], _Doc_Information[6]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[6].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // Seventh
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[7], _Doc_Information[7]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_8.png',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[7].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[7].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[7], _Doc_Information[7]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[7].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // 8th
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[8], _Doc_Information[8]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_9.png',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[8].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[8].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[8], _Doc_Information[8]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[8].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // 9th
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[9], _Doc_Information[9]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_10.png',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[9].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[9].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[9], _Doc_Information[9]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[9].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
              Container(
                width: 13 * Factor_Height,
              ),
            ],
          ),
        ),
        Container(
          height: 41 * Factor_Height,
        ),
      ],
    );
  }

  Widget _Build_Fourth()
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
          margin: EdgeInsets.symmetric(horizontal: 21.0 * Factor_Width),
          height: 40 * Factor_Height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '창업&공모전 Event ',
                style: TextStyle(
                  fontFamily: 'Spoqa-Bold',
                  fontSize: 20.0 * Factor_Height,
                ),
              ),
              Container(
                width: 24 * Factor_Height,
                height: 24 * Factor_Height,
                child: Image.asset('assets/Start_Up_Event.png'),
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
          height: 130 * Factor_Height,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 13 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[0], _Doc_Information[0]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_1.png',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[0].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[0].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[0], _Doc_Information[0]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[0].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // First
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[1], _Doc_Information[1]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_2.jpg',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[1].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[1].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[1], _Doc_Information[1]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[1].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // Second
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[2], _Doc_Information[2]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_3.png',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[2].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[2].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[2], _Doc_Information[2]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[2].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // Third
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[3], _Doc_Information[3]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_4.png',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[3].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[3].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[3], _Doc_Information[3]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[3].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // Fourth
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[4], _Doc_Information[4]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_5.jpg',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[4].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[4].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[4], _Doc_Information[4]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[4].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // Fifth
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[5], _Doc_Information[5]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_6.png',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[5].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[5].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[5], _Doc_Information[5]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[5].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // Sixth
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[6], _Doc_Information[6]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_7.png',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[6].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[6].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[6], _Doc_Information[6]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[6].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // Seventh
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[7], _Doc_Information[7]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_8.png',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[7].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[7].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[7], _Doc_Information[7]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[7].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // 8th
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[8], _Doc_Information[8]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_9.png',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[8].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[8].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[8], _Doc_Information[8]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[8].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ), // 9th
              Container(
                width: 10 * Factor_Height,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_Heart_Num(_Activity_Name[9], _Doc_Information[9]),
                      child: Stack(
                        children: [
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(3.0, 3.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 125 * Factor_Height,
                            width: 110 * Factor_Height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: const <Color>[
                                  Color.fromRGBO(205, 0, 81, 0.2),
                                  Color.fromRGBO(205, 0, 81, 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 75.0 * Factor_Height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        'assets/Home_Page_Activity_Photo_10.png',
                                      ),
                                    ),
                                  ),
                                  width: 100.0 * Factor_Height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0.0, 4.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6.0 * Factor_Height,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 28.0 * Factor_Height,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28 * Factor_Height,
                                        width: 74 * Factor_Height,
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                                            text: TextSpan(
                                              text: _Activity_Name[9].Heart_Activity_Name,
                                              style: TextStyle(
                                                fontFamily: 'Spoqa-Medium',
                                                fontSize: 11 * Factor_Height,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[9].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_Heart_Num(_Activity_Name[9], _Doc_Information[9]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Activity_Name[9].Like_Num}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Spoqa-Medium',
                                                  fontSize: 8 * Factor_Height,
                                                  color: Color(0xFF1C1C1C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 16 * Factor_Height,
                                        height: 27 * Factor_Height,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10.0 * Factor_Height,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
              Container(
                width: 13 * Factor_Height,
              ),
            ],
          ),
        ),
        Container(
          height: 41 * Factor_Height,
        ),
      ],
    );
  }

  Widget _Build_Fifth()
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
          height: 300 * Factor_Height,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 21.0 * Factor_Width),
                height: 40 * Factor_Height,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '인기 NFT ',
                      style: TextStyle(
                        fontFamily: 'Spoqa-Bold',
                        fontSize: 20.0 * Factor_Height,
                      ),
                    ),
                    Container(
                      width: 24 * Factor_Height,
                      height: 24 * Factor_Height,
                      child: Image.asset('assets/Favorite_NFT.png'),
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
                height: 200 * Factor_Height,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 187.5 * Factor_Height,
                    enlargeCenterPage: true,
                    viewportFraction: 0.5,
                    autoPlay: false,
                    onPageChanged: (e, reason)
                    {
                      setState(() {
                        _CurrentPage_Fifth = e;
                      });
                    },
                  ),

                  items: _Fifth_index.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Stack(
                          children: [
                            Container(
                              height: 187.5 * Factor_Height,
                              width: 187.5 * Factor_Height,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(3.0, 3.0), //(x,y)
                                    blurRadius: 4.0,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              //margin: EdgeInsets.symmetric(horizontal: 24.0 * Factor_Width),
                              //width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6.0),
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Fifth_List[i].ImagePath,
                                ),
                              ),
                              height: 187.5 * Factor_Height,
                              width: 187.5 * Factor_Height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(color: Color(0xFFD4D4D4)),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Container(
                height: 20 * Factor_Height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CarouselIndicator(
                      count: Fifth_List.length,
                      index: _CurrentPage_Fifth,
                      color: Color.fromRGBO(164, 164, 164, 0.8),
                      activeColor: Colors.black,
                      width: 20.0 * Factor_Width,
                      height: 4.0 * Factor_Height,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}