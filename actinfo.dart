import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'infolist.dart';
import 'package:url_launcher/url_launcher.dart';

Act thisact = Act.def(); //default 생성자로 생성
extraAct thisextraact = extraAct.def();

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
            home: thisact,
            debugShowCheckedModeBanner: false,
          );
        }
    );
  }
}


void imagetoactinfo(String path){ //image를 눌렀을 때 그 이미지에 맞는 actinfo를 가져오는 함수

  var tempact = Act.def();

  if(allactlist.length==0) makeactlist(); // allactlist가 만들어지기 전에 함수를 호출한 경우 for문이 안돌아감

  for(int i = 0; i< allactlist.length; i++){

    if(path == allactlist[i]['image_path']){

      var curact = allactlist[i];

      tempact.activity_name = curact['activity_name'];
      tempact.application_available = curact['application_available']; //활동 이름
      tempact.application_period = curact['application_period']; //시작 날짜
      tempact.category = curact['category'];
      tempact.email = curact['e-mail'];
      tempact.participating_grade = curact['participating_grade'];
      tempact.operation_department = curact['operation_department'];
      tempact.operation_period = curact['operation_period'];
      tempact.image_path = curact['image_path'];
      tempact.PAM = curact['pam'];

      break;

    }


  }
  Act.copy(tempact); //복사 생성자 호출 및 widget 빌드

  return;

}


class actinfo extends StatefulWidget {

  //class 안에 불필요하게 act를 다 집어넣는것보다는, 전역변수로 thisact 변수를 선언해서 이를 활용하는 방식이 나을 듯. 그렇게 수정했음 (아래는 수정 전 버전임)

  /*
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

  */

  actinfo(Act act){ //값 넣어주기

    /*

    this.activity_name = act.activity_name;
    this.application_available = act.application_available;
    this.application_period = act.application_period;
    this.category= act.category;
    this.email = act.email;
    this.participating_grade= act.participating_grade;
    this.operation_department = act.operation_department;
    this.image_path = act.image_path;
    this.PAM = act.PAM;

     */

    //act 값을 가져와서 전역변수 thisact를 initialize 해줌

    thisact.activity_name = act.activity_name;
    thisact.application_available = act.application_available;
    thisact.application_period = act.application_period;
    thisact.category= act.category;
    thisact.email = act.email;
    thisact.participating_grade= act.participating_grade;
    thisact.operation_department = act.operation_department;
    thisact.image_path = act.image_path;
    thisact.PAM = act.PAM;

  }

  @override
  _actinfoState createState() => _actinfoState();
}

class _actinfoState extends State<actinfo> {

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
        //child:Expanded(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Container(
                  height: 26 * Factor_Height,
                ),
                Container(
                  // # 진행중  #공모전/대회
                  height: 30 * Factor_Height,
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: Factor_Width * 33
                      ),
                      Text(
                        //'#' + thisact.widget.application_available! + ' #' + this.widget.category!,
                        '#' + thisact.application_available! + ' #' + thisact.category!,
                        style: TextStyle(
                          fontSize: 25.5 * Factor_Height,
                          fontFamily: 'Spoqa-Bold',
                          color: Color(0xFF3C3C3C),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 17 * Factor_Height,
                ),
                Container(
                  //활동 사진 들어갈 곳
                  height: 254 * Factor_Height,
                  child: Image.asset(
                    //this.widget.image_path!,
                    thisact.image_path!,
                    height: 254 * Factor_Height,
                    width: 296 * Factor_Width,
                  ),
                ),
                Container(
                  height: 30 * Factor_Height,
                ),
                Container(
                  height: 80 * Factor_Height,
                  child: Text(
                    //this.widget.activity_name!,
                    thisact.activity_name!,
                    style: TextStyle(
                      fontSize: 32 * Factor_Height,
                      fontFamily: 'Spoqa-Bold',
                      color: Color(0xFF3C3C3C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 34 * Factor_Height,
                ),
                Container(
                  height: 83 * Factor_Height, //"신청 기간"
                  child: Column(
                    children: [
                      Container(
                          height: 28 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                '신청 기간',
                                style: TextStyle(
                                  fontSize: 24.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Bold',
                                  color: Color(0xFF3C3C3C),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          height: 18 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                //this.widget.application_period!,
                                thisact.application_period!,
                                style: TextStyle(
                                  fontSize: 17.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Regular',
                                  color: Color(0xFFCFCFCF),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          child:
                          Divider(color: Color(0XFFCFCFCF), indent: 28, endIndent: 28, thickness: 2.0))
                      ,
                    ],
                  ),
                ),
                Container(
                  height: 40 * Factor_Height,
                ),
                Container(
                  height: 83 * Factor_Height, //"활동 기간"
                  child: Column(
                    children: [
                      Container(
                          height: 28 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                '활동 기간',
                                style: TextStyle(
                                  fontSize: 24.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Bold',
                                  color: Color(0xFF3C3C3C),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          height: 18 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                //this.widget.operation_period!,
                                thisact.operation_period!,
                                style: TextStyle(
                                  fontSize: 17.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Regular',
                                  color: Color(0xFFCFCFCF),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          child:
                          Divider(color: Color(0XFFCFCFCF), indent: 28, endIndent: 28, thickness: 2.0))
                    ],
                  ),
                ),
                Container(
                  height: 40 * Factor_Height,
                ),
                Container(
                  height: 83 * Factor_Height, //"참여 학년"
                  child: Column(
                    children: [
                      Container(
                          height: 28 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                '참여 학년',
                                style: TextStyle(
                                  fontSize: 24.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Bold',
                                  color: Color(0xFF3C3C3C),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          height: 18 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                //this.widget.participating_grade!,
                                thisact.participating_grade!,
                                style: TextStyle(
                                  fontSize: 17.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Regular',
                                  color: Color(0xFFCFCFCF),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          child:
                          Divider(color: Color(0XFFCFCFCF), indent: 28, endIndent: 28, thickness: 2.0))
                    ],
                  ),
                ),
                Container(
                  height: 40 * Factor_Height,
                ),
                Container(
                  height: 83 * Factor_Height, //활동기간, 연락처 등 그룹으로 구현, row 필요
                  child: Column(
                    children: [
                      Container(
                          height: 28 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                '담당 기관',
                                style: TextStyle(
                                  fontSize: 24.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Bold',
                                  color: Color(0xFF3C3C3C),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          height: 18 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                //this.widget.operation_department!,
                                thisact.operation_department!,
                                style: TextStyle(
                                  fontSize: 17.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Regular',
                                  color: Color(0xFFCFCFCF),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          child:
                          Divider(color: Color(0XFFCFCFCF), indent: 28, endIndent: 28, thickness: 2.0))
                    ],
                  ),
                ),
                Container(
                  height: 40 * Factor_Height,
                ),
                /*
                Container(
                  height: 83 * Factor_Height, //"연락처"
                  child: Column(
                    children: [
                      Container(
                          height: 28 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                '연락처',
                                style: TextStyle(
                                  fontSize: 24.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Bold',
                                  color: Color(0xFF3C3C3C),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          height: 18 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                '054-279-9002',
                                style: TextStyle(
                                  fontSize: 17.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Regular',
                                  color: Color(0xFFCFCFCF),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          child:
                          Divider(color: Color(0XFFCFCFCF), indent: 28, endIndent: 28, thickness: 2.0))
                    ],
                  ),
                ),
                Container(
                  height: 40 * Factor_Height,
                ),
                */
                Container(
                  height: 83 * Factor_Height, //"이메일"
                  child: Column(
                    children: [
                      Container(
                          height: 28 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                '연락처',
                                style: TextStyle(
                                  fontSize: 24.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Bold',
                                  color: Color(0xFF3C3C3C),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          height: 18 * Factor_Height,
                          child: Row(
                            children: [
                              Container(
                                width: 33 * Factor_Width,
                              ),
                              Text(
                                //this.widget.email!,
                                thisact.email!,
                                style: TextStyle(
                                  fontSize: 17.5 * Factor_Height,
                                  fontFamily: 'Spoqa-Regular',
                                  color: Color(0xFFCFCFCF),
                                ),
                              ),
                            ],
                          )),
                      Container(height: 10 * Factor_Height),
                      Container(
                          child:
                          Divider(color: Color(0XFFCFCFCF), indent: 28, endIndent: 28, thickness: 2.0))
                    ],
                  ),
                ),
                Container(
                  height: 33 * Factor_Height,
                ),
                Container(
                  // '신청하기' 버튼
                  height: 53 * Factor_Height,
                  child: Container(
                    width: 300 * Factor_Width,
                    child: GestureDetector(
                      onTap: () {
                        // 누르면 신청하는 페이지로 넘어가게
                      },
                      child: Stack(
                        children: [
                          Center(
                            child: Opacity(
                              opacity: 0.73,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFCD0051),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: 300 * Factor_Width,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '신청하기',
                              style: TextStyle(
                                fontSize: 17 * Factor_Width,
                                fontFamily: 'Spoqa-Bold',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 33 * Factor_Height,
                ),
              ],
            ),
          ],
        ),
      ),

      //  ),
    );
  }
}

class extrainfo extends StatefulWidget {


  extrainfo(extraAct act){ //값 넣어주기

    thisextraact.activity_name = act.activity_name;
    thisextraact.application_link = act.application_link;
    thisextraact.detail_link = act.detail_link;
    thisextraact.image_path= act.image_path;

  }

  @override
  _extrainfoState createState() => _extrainfoState();
}

class _extrainfoState extends State<actinfo> {

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
        //child:Expanded(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Container(
                  height: 26 * Factor_Height,
                ),
                Container(
                  // # 진행중  #공모전/대회
                  height: 30 * Factor_Height,
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: Factor_Width * 33
                      ),
                      Text(
                        '#창업 & 공모전',
                        style: TextStyle(
                          fontSize: 25.5 * Factor_Height,
                          fontFamily: 'Spoqa-Bold',
                          color: Color(0xFF3C3C3C),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 17 * Factor_Height,
                ),
                Container(
                  //활동 사진 들어갈 곳
                  height: 254 * Factor_Height,
                  child: Image.asset(
                    thisextraact.image_path!,
                    height: 254 * Factor_Height,
                    width: 296 * Factor_Width,
                  ),
                ),
                Container(
                  height: 30 * Factor_Height,
                ),
                Container(
                  height: 80 * Factor_Height,
                  child: Text(
                    thisextraact.activity_name!,
                    style: TextStyle(
                      fontSize: 32 * Factor_Height,
                      fontFamily: 'Spoqa-Bold',
                      color: Color(0xFF3C3C3C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 40 * Factor_Height,
                ),
                Container(
                  // 상세정보 확인 버튼
                  height: 53 * Factor_Height,
                  child: Container(
                    width: 300 * Factor_Width,
                    child: GestureDetector(
                      onTap: () {
                        launchUrlString(thisextraact.detail_link!);
                      },
                      child: Stack(
                        children: [
                          Center(
                            child: Opacity(
                              opacity: 0.73,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFCD0051),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: 300 * Factor_Width,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '더 자세히 알아보기 ',
                              style: TextStyle(
                                fontSize: 17 * Factor_Width,
                                fontFamily: 'Spoqa-Bold',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 33 * Factor_Height,
                ),
                Container(
                  // '지원하러 가기' 버튼
                  height: 53 * Factor_Height,
                  child: Container(
                    width: 300 * Factor_Width,
                    child: GestureDetector(
                      onTap: () {
                        launchUrlString(thisextraact.application_link!);
                      },
                      child: Stack(
                        children: [
                          Center(
                            child: Opacity(
                              opacity: 0.73,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFCD0051),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: 300 * Factor_Width,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '지원하러 가기',
                              style: TextStyle(
                                fontSize: 17 * Factor_Width,
                                fontFamily: 'Spoqa-Bold',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      //  ),
    );
  }
}