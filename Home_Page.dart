import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'infolist.dart';
import 'actinfo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

Future<dynamic>? future_likenum;

int i = 0;

class AppController extends GetxController { // 푸시 알람
  static AppController get to => Get.find();

  final Rxn<RemoteMessage> message = Rxn<RemoteMessage>();

  Future<bool> initialize() async {
    // Firebase 초기화부터 해야 FirebaseMessaging 를 사용할 수 있다.
    await Firebase.initializeApp();

    // Android 에서는 별도의 확인 없이 리턴되지만, requestPermission()을 호출하지 않으면 수신되지 않는다.
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage rm) {
      message.value = rm;
    });

    return true;
  }
}

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

List<int> attentionrank = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; //관심도(참여자 + 좋아요 수) 순으로 인덱스를 정렬하는 리스트

void sortbyattention() {

  Attention.clear();

  for(int i = 0; i < 10; i++){

    Attention.add(ParticipateList[i]+LikenumList[i]); //attention list 추가

  }

  print(Attention);

  for (int i = 0; i < Attention.length; i++) {

    for (int j = 0; j < Attention.length - 1; j++) {

      if (Attention[j] < Attention[j+1]) { // 내림차순으로 정렬

        int temp = attentionrank[j];
        attentionrank[j] = attentionrank[j + 1];
        attentionrank[j + 1] = temp;

      }

    }
  }
}

class Heart_Like_Class
{
  String? Heart_Activity_Name;
  int Like_Num = 0;
  int Participant = 0;
  bool is_True = false;


  Heart_Like_Class(this.Heart_Activity_Name, this.Like_Num, this.Participant, this.is_True);

}


List<String> ImagepathList = [

];

List<String> extrapathList = [

];

List<int> LikenumList = [


];

List<int> ParticipateList = [


];

List<int> ExtraLikenumList = [


];



List<int> Attention = [


];

setlikenum() async{ //likenum 정보 firestore에서 가져와서 업데이트해주는 함수

  var heartlist = await FirebaseFirestore.instance.collection('Activity_Collection').get();

  print(heartlist.docs.length);

  for(int i = 0; i < heartlist.docs.length; i++){

    Map<String, dynamic> tempdata = heartlist.docs[i].data();

    int templike = tempdata['Like_Num'];
    int temppart = tempdata['Participant'];

    print(templike); //디버깅용
    print(temppart);

    LikenumList.add(templike);
    ParticipateList.add(temppart);

  }

  return 1;

}

setextralikenum() async{ //likenum 정보 firestore에서 가져와서 업데이트해주는 함수

  var heartlist = await FirebaseFirestore.instance.collection('extra_Activity_Collection').get();

  print(heartlist.docs.length);

  for(int i = 0; i < heartlist.docs.length; i++){

    Map<String, dynamic> tempdata = heartlist.docs[i].data();

    int templike = tempdata['Like_Num'];
    int temppart = tempdata['Participant'];

    print(templike); //디버깅용
    print(temppart);

    ExtraLikenumList.add(templike);

  }

  return 1;

}

setimagepathlist() async{ //imagepath list를 생성하는 함수

  var pathlist = await FirebaseFirestore.instance.collection('UGRP').get();

  for(int i = 0; i < pathlist.docs.length; i++){

    Map<String, dynamic> tempdata = pathlist.docs[i].data();
    String temppath = tempdata['image_path'];

    print(temppath); //디버깅용

    ImagepathList.add(temppath);


  }

  var epathlist = await FirebaseFirestore.instance.collection('competition').get();

  for(int i = 0; i < epathlist.docs.length; i++){

    Map<String, dynamic> tempdata = epathlist.docs[i].data();
    String temppath = tempdata['image_path'];

    print(temppath); //디버깅용

    extrapathList.add(temppath);


  }
  return 1;

}

sethotlist() async{

  Second_List.clear();

  sortbyattention();

  for(int i = 0; i< 5; i++){

    Second_List.add(Build_Second_Class(Image.asset('assets/'+ImagepathList[attentionrank[i]], alignment: Alignment.center,), ImagepathList[attentionrank[i]]));
  }

  print(Second_List);


}


List<Heart_Like_Class> _Activity_Name = [
  Heart_Like_Class('2022 e-포트폴리오 비교과활동 로드맵 제안 공모전', LikenumList[0], ParticipateList[0], false),
  Heart_Like_Class('유니티(Unity)를 활용한 실감형 메타버스 콘텐츠 제작', LikenumList[1], ParticipateList[1], false),
  Heart_Like_Class('[온라인 특강] 엑셀을 활용한 데이터 분석과 시각화', LikenumList[2], ParticipateList[2], false),
  Heart_Like_Class('온라인 학습전략진단 에세이 작성', LikenumList[3], ParticipateList[3],false),
  Heart_Like_Class('제 7회 "CCRP 공유 플랫폼" 공모전', LikenumList[4], ParticipateList[4],false),
  Heart_Like_Class('학습윤리 캠페인 포스터 공모전', LikenumList[5], ParticipateList[5], false),
  Heart_Like_Class('[학습워크숍] 성격유형에 따른 자기관리 전략', LikenumList[6], ParticipateList[6], false),
  Heart_Like_Class('책 읽는 포스테키안(2022-4차)', LikenumList[7], ParticipateList[7], false),
  Heart_Like_Class('2022-2학기 러닝커뮤니티', LikenumList[8], ParticipateList[8],false),
  Heart_Like_Class('2022 학부생 연구프로그램', LikenumList[9], ParticipateList[9], false),
];

List<DocumentReference> _Doc_Information = [ // PAMS 활동 에 대한 DocumentReference list
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

List<Heart_Like_Class> _Extra_Activity_Name = [
  Heart_Like_Class('한동대 2023 Norithon 해커톤', ExtraLikenumList[0], 0, false),
  Heart_Like_Class('PARCS 2023 StartUp Hackathon', ExtraLikenumList[1], 0, false),
  Heart_Like_Class('포스텍 Mini-I-Corps', ExtraLikenumList[2], 0, false),
  Heart_Like_Class('삼성휴먼테크논문대상', ExtraLikenumList[3], 0,false),
  Heart_Like_Class('스트릿창업파이터', ExtraLikenumList[4], 0,false),
  Heart_Like_Class('포스텍 에너지 캠페인', ExtraLikenumList[5], 0, false),
  Heart_Like_Class('2022 전국 대학생 프로그래밍 경진대회', ExtraLikenumList[6], 0, false),
  Heart_Like_Class('삼성대학생프로그래밍 경진대회', ExtraLikenumList[7], 0, false),
];

List<DocumentReference> _Extra_Doc_Information = [ // 외부활동에 대한 DocumentReference list
  FirebaseFirestore.instance.collection('extra_Activity_Collection').doc('5m9Ik5EOnmnVdOtwC2xc'),
  FirebaseFirestore.instance.collection('extra_Activity_Collection').doc('DA0Hsplt0tJTMHENmh8U'),
  FirebaseFirestore.instance.collection('extra_Activity_Collection').doc('I5agZ2CAx5ZYl4Yr2t7y'),
  FirebaseFirestore.instance.collection('extra_Activity_Collection').doc('M4JUtpcoH9fZl94qeSx9'),
  FirebaseFirestore.instance.collection('extra_Activity_Collection').doc('Z978pIZbmpvzIOoBzAUZ'),
  FirebaseFirestore.instance.collection('extra_Activity_Collection').doc('dNUoJVTulnQrUPhWOjLD'),
  FirebaseFirestore.instance.collection('extra_Activity_Collection').doc('lvDScLkb9Jyqx7AFUwcE'),
  FirebaseFirestore.instance.collection('extra_Activity_Collection').doc('yj6F9T4SjI29LtNqXK8t'),

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
    FirebaseFirestore.instance.collection('Activity_Collection').doc(doc.id).update( //firebase에 set해줌
        {
          'Like_Num' : heart_like_class.Like_Num,
          'is_True' : heart_like_class.is_True,
        }
    );
  }

  void _add_extra_Heart_Num(Heart_Like_Class heart_like_class, DocumentReference doc)
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
    FirebaseFirestore.instance.collection('extra_Activity_Collention').doc(doc.id).update( //firebase에 set해줌
        {
          'Like_Num' : heart_like_class.Like_Num,
          'is_True' : heart_like_class.is_True,
        }
    );
  }

  _asyncMethod() async
  {
    await setlikenum();
    await setimagepathlist();
    await setextralikenum();
    await sethotlist();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: i == 0 ? FutureBuilder<dynamic>(
          future: _asyncMethod(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.hasData)
            {
              print("!1111111111111111111111111111");

              return ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  _Build_First(),
                  _Build_Second(), // 가장 핫한 활동
                  _Build_Third(), // PAMS 비교과 활동
                  _Build_Fourth(), // 창업 & 공모전 Event
                ],
              );
            }
            else if(snapshot.hasData == false)
            {
              return Center(child: CircularProgressIndicator(color: Color(0xFFCD0051)));
            }
            else if(snapshot.hasError)
            {
              return Center(child: CircularProgressIndicator());
            }
            else
            {
              return Center(child: CircularProgressIndicator());
            }
          }
      ) : ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _Build_First(),
          _Build_Second(), // 가장 핫한 활동
          _Build_Third(), // PAMS 비교과 활동
          _Build_Fourth(), // 창업 & 공모전 Event
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

  Widget _Build_Second() // 가장 핫한 활동
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
                    child: GestureDetector(
                      onTap: () {
                        //print("111111111111111111");
                        imagetoactinfo(Second_List[i].path!, context);
                      },
                      child: Container(
                        height: 30 * Factor_Height,
                        margin: EdgeInsets.symmetric(horizontal: 18.0 * Factor_Width),
                        child: Stack(
                            children: [
                              Container(child: Container(child: Image.asset('assets/'+Second_List[i].path!, fit: BoxFit.fill,),),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                              ),
                              Container(child: Container(child: Image.asset('assets/'+Second_List[i].path!, fit: BoxFit.fill,),
                                decoration: BoxDecoration(
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
                              ),
                            ]
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

  Widget _Build_Third() // PAMS 비교과 활동
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
                    Navigator.push(
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
                                        'assets/'+ImagepathList[0],
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
                                        'assets/'+ImagepathList[1],
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
                                        'assets/'+ImagepathList[2],
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
                                        'assets/'+ImagepathList[3],
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
                                        'assets/'+ImagepathList[4],
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
                                        'assets/'+ImagepathList[5],
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
                                        'assets/'+ImagepathList[6],
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
                                        'assets/'+ImagepathList[7],
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
                                        'assets/'+ImagepathList[8],
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
                                        'assets/'+ImagepathList[9],
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

  Widget _Build_Fourth() // 창업 & 공모전 event
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

                    Navigator.push(
                        context,
                        CupertinoPageRoute(builder:
                            (context) => extralisttabbar()));

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
                  stream: FirebaseFirestore.instance.collection('extra_Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_extra_Heart_Num(_Extra_Activity_Name[0], _Extra_Doc_Information[0]),
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
                                        'assets/'+extrapathList[0],
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
                                              text: _Extra_Activity_Name[0].Heart_Activity_Name,
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
                                                stream: FirebaseFirestore.instance.collection('extra_Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[0].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_extra_Heart_Num(_Extra_Activity_Name[0], _Extra_Doc_Information[0]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Extra_Activity_Name[0].Like_Num}',
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
                  stream: FirebaseFirestore.instance.collection('extra_Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_extra_Heart_Num(_Extra_Activity_Name[1], _Extra_Doc_Information[1]),
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
                                        'assets/'+extrapathList[1],
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
                                              text: _Extra_Activity_Name[1].Heart_Activity_Name,
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
                                                stream: FirebaseFirestore.instance.collection('extra_Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Extra_Activity_Name[1].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_extra_Heart_Num(_Extra_Activity_Name[1], _Extra_Doc_Information[1]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Extra_Activity_Name[1].Like_Num}',
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
                  stream: FirebaseFirestore.instance.collection('extra_Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_extra_Heart_Num(_Extra_Activity_Name[2], _Extra_Doc_Information[2]),
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
                                        'assets/'+extrapathList[2],
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
                                                stream: FirebaseFirestore.instance.collection('extra_Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Extra_Activity_Name[2].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_extra_Heart_Num(_Extra_Activity_Name[2], _Extra_Doc_Information[2]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Extra_Activity_Name[2].Like_Num}',
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
                  stream: FirebaseFirestore.instance.collection('extra_Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_extra_Heart_Num(_Extra_Activity_Name[3], _Extra_Doc_Information[3]),
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
                                        'assets/'+extrapathList[3],
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
                                              text: _Extra_Activity_Name[3].Heart_Activity_Name,
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
                                                stream: FirebaseFirestore.instance.collection('extra_Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Extra_Activity_Name[3].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_extra_Heart_Num(_Extra_Activity_Name[3], _Extra_Doc_Information[3]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Extra_Activity_Name[3].Like_Num}',
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
                  stream: FirebaseFirestore.instance.collection('extra_Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_extra_Heart_Num(_Extra_Activity_Name[4], _Extra_Doc_Information[4]),
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
                                        'assets/'+extrapathList[4], //수정 필요, imagepath를 Doc_information으로 접근해서 해당 document의 imagepath로 접근을 필요로함.
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
                                              text: _Extra_Activity_Name[4].Heart_Activity_Name,
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
                                                stream: FirebaseFirestore.instance.collection('extra_Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Activity_Name[4].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_extra_Heart_Num(_Extra_Activity_Name[4], _Extra_Doc_Information[4]),
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
                  stream: FirebaseFirestore.instance.collection('extra_Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_extra_Heart_Num(_Extra_Activity_Name[5], _Extra_Doc_Information[5]),
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
                                        'assets/'+extrapathList[5],
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
                                              text: _Extra_Activity_Name[5].Heart_Activity_Name,
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
                                                stream: FirebaseFirestore.instance.collection('extra_Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Extra_Activity_Name[5].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_extra_Heart_Num(_Extra_Activity_Name[5], _Extra_Doc_Information[5]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Extra_Activity_Name[5].Like_Num}',
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
                  stream: FirebaseFirestore.instance.collection('extra_Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_extra_Heart_Num(_Extra_Activity_Name[6], _Extra_Doc_Information[6]),
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
                                        'assets/'+extrapathList[6],
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
                                              text: _Extra_Activity_Name[6].Heart_Activity_Name,
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
                                                stream: FirebaseFirestore.instance.collection('extra_Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Extra_Activity_Name[6].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_extra_Heart_Num(_Activity_Name[6], _Doc_Information[6]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Extra_Activity_Name[6].Like_Num}',
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
                  stream: FirebaseFirestore.instance.collection('extra_Activity_Collection').snapshots(),
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onDoubleTap: () => _add_extra_Heart_Num(_Extra_Activity_Name[7], _Extra_Doc_Information[7]),
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
                                        'assets/'+extrapathList[7],
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
                                              text: _Extra_Activity_Name[7].Heart_Activity_Name,
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
                                                stream: FirebaseFirestore.instance.collection('extra_Activity_Collection').snapshots(),
                                                builder: (context, snapshot) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      width: 16 * Factor_Height,
                                                      height: 15 * Factor_Height,
                                                      child: _Extra_Activity_Name[7].is_True ? Image.asset('assets/heart (2).png') : Image.asset('assets/heart (1).png'),
                                                    ),
                                                    onTap: () => _add_extra_Heart_Num(_Extra_Activity_Name[7], _Extra_Doc_Information[7]),
                                                  );
                                                }
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Text(
                                                '${_Extra_Activity_Name[7].Like_Num}',
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