import 'package:flutter/material.dart';
import 'actinfo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var firestore = FirebaseFirestore.instance;

Future<dynamic>? future_actlist;
Future<dynamic>? future_extralist;

List <Map<String, dynamic>> allactlist = [];
List <Map<String, dynamic>> availableactlist = []; // 신청 가능한 리스트
List <Map<String, dynamic>> nowactlist = []; // 운영 중인 리스트
List <Map<String, dynamic>> endedactlist = []; // 종료된 리스트
List <Map<String, dynamic>> extraactlist = []; // 외부 활동 리스트

makeactlist() async {

  allactlist.clear();
  extraactlist.clear();

  var tempact = await FirebaseFirestore.instance
      .collection('UGRP')
      .get(); //활동 list query 가져오기

  print(tempact.docs.length);

  for (int i = 0; i < tempact.docs.length; i++) { // 활동 넣고, 운영 중 / 신청 가능 / 종료된 활동으로 분류하기
    Map<String, dynamic> temp = tempact.docs[i].data();
    // allactlist.add(temp); // 1번 선택지
    allactlist.add({
      'activity_name': temp['activity_name'], // 활동 이름
      'application_available': temp['application_available'], // 신청 가능 여부 (활동의 종류)
      'application_period': temp['application_period'], // 신청 기간
      'category': temp['category'], // 카테고리
      'contact' : temp['contact'], // 담당자 연락처
      'e-mail' : temp['e-mail'], // 담당자 이메일
      'head_count' : temp['head_count'], // 신청자 수
      'image_path' : temp['image_path'], // 활동 이미지 경로
      'manager' : temp['manager'], // 담당자
      'operation_department' : temp['operation_department'], // 담당 기관
      'operation_period' : temp['operation_period'], //활동 기간
      'pam': temp['pam'], // 팜
      'participating_grade' : temp['participating_grade'], // 참여 학년
    });

    //print("!111111111111111");

    if (temp['application_available'] == '운영중') nowactlist.add(temp); // 운영 중일 경우
    else if (temp['application_available'] == '신청가능') availableactlist.add(temp); // 신청 가능한 경우
    else endedactlist.add(allactlist[i]); // 종료된 경우

  }

  var tempextraact = await FirebaseFirestore.instance
      .collection('competition')
      .get(); //활동 list query 가져오기

  print(tempextraact.docs.length);

  for (int i = 0; i < tempextraact.docs.length; i++) { // 활동 넣고, 운영 중 / 신청 가능 / 종료된 활동으로 분류하기
    Map<String, dynamic> temp = tempextraact.docs[i].data();
    extraactlist.add({
      'activity_name': temp['activity_name'], // 활동 이름
      'application_link': temp['application_link'], // 지원 링크
      'detail_link': temp['detail_link'], // 상세정보 링크
      'image_path' : temp['image_path'] // 활동 이미지 경로
    });
  }

  print(allactlist.length);
  print(nowactlist.length);
  print(availableactlist.length);
  print(endedactlist.length);
  print(extraactlist.length);
  print("!111111111111111111111111111");

  return 1;

}

class infolisttabbar extends StatefulWidget {
  const infolisttabbar({Key? key}) : super(key: key);


  @override
  _infolisttabbarState createState() => _infolisttabbarState();
}


class _infolisttabbarState extends State<infolisttabbar>
    with TickerProviderStateMixin {
  late TabController _tabController;


  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    future_actlist = makeactlist(); //활동 list 만들기, (future 중복 방지)
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0, //버튼 - default 옵션으로 pop하게
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,

      body: FutureBuilder<dynamic>(
          future: future_actlist,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            print("22222222222222222222222");
            if (snapshot.hasData) {
              print("!1111111111111111111");
              return ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Container(
                    height: 40 * Factor_Height,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: TabBar(
                      tabs: [
                        Container(
                          height: 40 * Factor_Height,
                          alignment: Alignment.center,
                          child: Text(
                            '신청 가능',
                          ),
                        ),
                        Container(
                          height: 40 * Factor_Height,
                          alignment: Alignment.center,
                          child: Text(
                            '신청 종료',
                          ),
                        ),
                        Container(
                          height: 40 * Factor_Height,
                          alignment: Alignment.center,
                          child: Text(
                            '운영 중',
                          ),
                        ),
                      ],
                      indicator: BoxDecoration(),
                      labelColor: Colors.grey,
                      unselectedLabelColor: Colors.black,
                      controller: _tabController,
                    ),
                  ),
                  //Container(height:  * Factor_Height,),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Column(
                          // 신청 가능한 활동 리스트

                          children: [

                            for(int i = 0; i < availableactlist.length; i++)
                              Act(1, i)

                          ],

                        ),
                        Column(
                          // 신청 종료된 활동 리스트
                          children: [

                            for(int i = 0; i < endedactlist.length; i++)
                              Act(3, i)

                          ],


                        ),
                        Column(
                          // 운영 중인 활동 리스트

                          children: [

                            for(int i = 0; i < nowactlist.length; i++)
                              Act(2, i)

                          ],


                        ),
                      ],
                    ),
                  ),
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
      ),
    );
  }
}

class extralisttabbar extends StatefulWidget {
  const extralisttabbar({Key? key}) : super(key: key);


  @override
  _extralisttabbarState createState() => _extralisttabbarState();
}


class _extralisttabbarState extends State<extralisttabbar> {


  @override
  void initState() {

    future_extralist = makeactlist(); //활동 list 만들기, (future 중복 방지)
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0, //버튼 - default 옵션으로 pop하게
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,

      body: FutureBuilder<dynamic>(
          future: future_extralist,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [

                  Expanded(
                    child: TabBarView(
                      children: [
                        Column(
                          // 신청 가능한 활동 리스트

                          children: [

                            for(int i = 0; i < extraactlist.length; i++)
                              extraAct(i)

                          ],

                        ),

                      ],
                    ),
                  ),
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
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: Colors.white,
            ),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: infolist(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}

class Act extends StatelessWidget {
  //활동을 나타내는 act class 구현

  String? activity_name; //활동 유형
  String? application_available; //활동 이름
  String? application_period; //시작 날짜
  String? category;
  String? email;
  String? participating_grade;
  String? operation_department;
  String? operation_period;
  String? image_path;
  int? PAM;

  Act.def(){ //default 생성자

    activity_name = ''; //활동 유형
    application_available = ''; //활동 이름
    application_period = ''; //시작 날짜
    category = '';
    email = '';
    participating_grade = '';
    operation_department = '';
    operation_period = '';
    image_path = '';
    PAM = 0;
    return; //생성만 하고 widget build 하지 않고 return

  }

  Act.copy(Act tempact){ // 복사생성자

    activity_name = tempact.activity_name;
    application_available = tempact.application_available; //활동 이름
    application_period = tempact.application_period; //시작 날짜
    category = tempact.category;
    email = tempact.email;
    participating_grade = tempact.participating_grade;
    operation_department = tempact.operation_department;
    operation_period = tempact.operation_period;
    image_path = tempact.image_path;
    PAM = tempact.PAM;
  }

  Act(int available, int idx){ //  Act initializer - 어떤 상태 종류의 활동이고, 그 활동 리스트의 몇 번째 인덱스인지를 매개변수로 받아서 전역변수 활동 리스트에서 값 가져옴.

    if (available == 1){ // 신청 가능 리스트

      activity_name = availableactlist[idx]['activity_name'];
      application_available = availableactlist[idx]['application_available']; //활동 이름
      application_period = availableactlist[idx]['application_period']; //시작 날짜
      category = availableactlist[idx]['category'];
      email = availableactlist[idx]['e-mail'];
      participating_grade = availableactlist[idx]['participating_grade'];
      operation_department = availableactlist[idx]['operation_department'];
      operation_period = availableactlist[idx]['operation_period'];
      image_path = availableactlist[idx]['image_path'];
      PAM = availableactlist[idx]['pam'];

    }

    else if (available == 2){ // 운영 중 리스트

      activity_name = nowactlist[idx]['activity_name'];
      application_available = nowactlist[idx]['application_available']; //활동 이름
      application_period = nowactlist[idx]['application_period']; //시작 날짜
      category = nowactlist[idx]['category'];
      email = nowactlist[idx]['e-mail'];
      participating_grade = nowactlist[idx]['participating_grade'];
      operation_department = nowactlist[idx]['operation_department'];
      operation_period = nowactlist[idx]['operation_period'];
      image_path = nowactlist[idx]['image_path'];
      PAM = nowactlist[idx]['pam'];

    }

    else { // 종료된 리스트

      activity_name = endedactlist[idx]['activity_name'];
      application_available = endedactlist[idx]['application_available']; //활동 이름
      application_period = endedactlist[idx]['application_period']; //시작 날짜
      category = endedactlist[idx]['category'];
      email = endedactlist[idx]['e-mail'];
      participating_grade = endedactlist[idx]['participating_grade'];
      operation_department = endedactlist[idx]['operation_department'];
      operation_period = endedactlist[idx]['operation_period'];
      image_path = endedactlist[idx]['image_path'];
      PAM = endedactlist[idx]['pam'];

    }

  }

  @override
  Widget build(BuildContext context) {
    // data 연동하려면 활동 정보, 이름 등 여러 string을 매개변수로 가져와서 initialize 하는 구조로 만들어야 할듯?

    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    return Container( // 내용이 차 있는 경우 Container 빌드
      height: 105 * Factor_Height,
      width: 375 * Factor_Width,
      decoration: BoxDecoration(
        color: Color(0xCFCFCF),
        border: Border.all(
          width: 1,
          color: Color(0xFF807D7D),
        ),
      ),
      child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => actinfo(this)), // 누르면 그 활동의 정보로 들어가게 설정
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 9 * Factor_Width),
              Container(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      width: 86 * Factor_Width,
                      height: 95 * Factor_Height,
                      child: Image.asset(
                        //'assets/Group 45.png',
                        image_path!,
                        height: 95 * Factor_Height,
                        width: 86 * Factor_Width,
                      ),
                    ),

                  ],
                ),
              ),
              Container(width: 9 * Factor_Width),
              Container(
                  width: 261 * Factor_Width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 15 * Factor_Height),
                      Container(
                        height: 15 * Factor_Height,
                        child: Text(
                          category!,
                          style: TextStyle(
                            fontSize: 15 * Factor_Height,
                            fontFamily: 'Spoqa-Bold',
                            color: Color(0xFF807D7D),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(height: 5 * Factor_Height),
                      Container(
                        height: 15 * Factor_Height,
                        child: Text(
                          activity_name!,
                          style: TextStyle(
                            fontSize: 15 * Factor_Height,
                            fontFamily: 'Spoqa-Bold',
                            color: Color(0xFF2C2C2C),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(height: 5 * Factor_Height),
                      Container(
                        height: 13 * Factor_Height,
                        child: Text(
                          application_period!,
                          style: TextStyle(
                            fontSize: 13 * Factor_Height,
                            fontFamily: 'Spoqa-Medium',
                            color: Color(0xFF2C2C2C),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(height: 5 * Factor_Height),
                      Container(
                        height: 13 * Factor_Height,
                        child: Text(
                          'PAM ${PAM.toString()}',
                          style: TextStyle(
                            fontSize: 13 * Factor_Height,
                            fontFamily: 'Spoqa-Medium',
                            color: Color(0xFF845A5A),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}

class extraAct extends StatelessWidget {
  //활동을 나타내는 act class 구현

  String? activity_name; //활동 유형
  String? application_link; //활동 이름
  String? detail_link; //시작 날짜
  String? image_path;

  extraAct(int idx){ //index 받아서 생성하는 생성자


    activity_name = extraactlist[idx]['activity_name'];
    application_link = extraactlist[idx]['application_link']; //활동 이름
    detail_link = extraactlist[idx]['detail_link']; //시작 날짜
    image_path = extraactlist[idx]['image_path'];


  }

  extraAct.def(){ //default 생성자

    activity_name = ''; //활동 유형
    application_link = ''; //활동 이름
    detail_link = ''; //시작 날짜
    image_path = '';


    return; //생성만 하고 widget build 하지 않고 return

  }

  @override
  Widget build(BuildContext context) {
    // data 연동하려면 활동 정보, 이름 등 여러 string을 매개변수로 가져와서 initialize 하는 구조로 만들어야 할듯?

    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    return Container( // 내용이 차 있는 경우 Container 빌드
      height: 105 * Factor_Height,
      width: 375 * Factor_Width,
      decoration: BoxDecoration(
        color: Color(0xCFCFCF),
        border: Border.all(
          width: 1,
          color: Color(0xFF807D7D),
        ),
      ),
      child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => extrainfo(this)), // 누르면 그 활동의 정보로 들어가게 설정
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 9 * Factor_Width),
              Container(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      width: 86 * Factor_Width,
                      height: 95 * Factor_Height,
                      child: Image.asset(
                        image_path!,
                        height: 95 * Factor_Height,
                        width: 86 * Factor_Width,
                      ),
                    ),

                  ],
                ),
              ),
              Container(width: 9 * Factor_Width),
              Container(
                  width: 261 * Factor_Width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 20 * Factor_Height),
                      Container(
                        height: 15 * Factor_Height,
                        child: Text(
                          '[창업 & 공모전]',
                          style: TextStyle(
                            fontSize: 15 * Factor_Height,
                            fontFamily: 'Spoqa-Bold',
                            color: Color(0xFF807D7D),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(height: 5 * Factor_Height),
                      Container(
                        height: 15 * Factor_Height,
                        child: Text(
                          activity_name!,
                          style: TextStyle(
                            fontSize: 15 * Factor_Height,
                            fontFamily: 'Spoqa-Bold',
                            color: Color(0xFF2C2C2C),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(height: 5 * Factor_Height),
                      Container(
                        height: 13 * Factor_Height,
                        child: Text(
                          '기간: 상세 정보 확인',
                          style: TextStyle(
                            fontSize: 13 * Factor_Height,
                            fontFamily: 'Spoqa-Medium',
                            color: Color(0xFF2C2C2C),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(height: 5 * Factor_Height),

                    ],
                  )),
            ],
          )),
    );
  }
}


class infolist extends StatefulWidget {
  @override
  _infolistState createState() => _infolistState();
}

class _infolistState extends State<infolist> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0, //버튼 - default 옵션으로 pop하게
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(

      ),

    );
  }
}