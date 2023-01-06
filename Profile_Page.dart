import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'Profile_Edit_Page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



Future<dynamic>? future_profile;
Future<dynamic>? future_activity;

String? username;
String? grade;
String? major;
String? id;
String? state;
String? major_image;
String? URL;
String? NickName_Split;
String? NickName = '';
String? Profile_path = 'default_profile.png';
String? introduce = '';

List<dynamic> schoolact = [] as List<dynamic>;
List<dynamic> snamelist = [] as List<dynamic>;

List<dynamic> clubact = [] as List<dynamic>;
List<dynamic> cnamelist = [] as List<dynamic>;

List<dynamic> volunteer = [] as List<dynamic>;
List<dynamic> vnamelist = [] as List<dynamic>;

List<dynamic> extraact = [] as List<dynamic>;
List<dynamic> enamelist = [] as List<dynamic>;

List<dynamic> NFT_Information = [3, 'THE_GENESIS', 0, 20220907, 20221225, '생활자치회', '금상', 9999, 0];
List<dynamic> NFT_Information_2 = [2, '차은성 바보', 0, 20220907, 20221225, '신상현', '멍청이', 999, 0];
List<dynamic> NFT = [] as List<dynamic>;


class Profile_Page extends StatefulWidget {
  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page>
    with TickerProviderStateMixin {
  static final storage = FlutterSecureStorage();

  String? userInfo = '';

  //late TabController _tabController;
  getprofileData() async{

    userInfo = await storage.read(key: "login");
    URL = userInfo!.split(" ")[1];
    NickName = await storage.read(key: "NickName");
    NickName_Split = NickName!.split(" ")[1];

    var docsnapshot = await FirebaseFirestore.instance.collection('users').doc(URL).get();

    Map<String, dynamic> data = docsnapshot.data() as Map<String, dynamic>;

    username = data['이름'] ?? null;
    grade = data['학년'] ?? null;
    //id = data['id'] ?? null;
    major = data['학과'] ?? null;
    state = data['학적'] ?? null;
    //NickName = profile_data['NickName'] ?? null;
    switch(major){

      case '화학과' :
        major_image = 'assets/postech_che.jpg';
        break;
      case '화학공학과' :
        major_image = 'assets/postech_ce.jpg';
        break;
      case '수학과' :
        major_image = 'assets/postech_math.jpg';
        break;
      case '산업경영공학과' :
        major_image = 'assets/postech_ime.jpg';
        break;
      case 'IT융합공학과' :
        major_image = 'assets/postech_cite.jpg';
        break;
      case '기계공학과' :
        major_image = 'assets/postech_me.png';
        break;
      case '컴퓨터공학과' :
        major_image = 'assets/postech_cse.jpg';
        break;
      case '전기전자공학과' :
        major_image = 'assets/postech_ee.jpg';
        break;
      case '생명과학과' :
        major_image = 'assets/postech_life.jpg';
        break;
      case '물리학과' :
        major_image = 'assets/postech_phys.jpg';
        break;
      case '신소재공학과' :
        major_image = 'assets/postech_mse.jpg';
        break;
      case '무은재학부' :
        major_image = 'assets/postech_mej.png';
        break;
      default:
        major_image = 'assets/postech_mej.png';
    }
    return major_image;

  }

  getactData() async{
    schoolact.clear();
    clubact.clear();
    volunteer.clear();
    extraact.clear();
    NFT.clear();
    snamelist.clear();
    cnamelist.clear();
    vnamelist.clear();
    enamelist.clear();

    var schoolactlist = await FirebaseFirestore.instance.collection('users').doc(URL).collection('schoolAct').get();

    for (int i = 0; i < schoolactlist.docs.length; i++) {
      Map<String, dynamic> temp = schoolactlist.docs[i].data();
      Map<String, dynamic> act = {};
      act.addAll({'수상': temp['수상'], '운영기간': temp['운영기간'],'운영부서': temp['운영부서'],'활동명': temp['활동명'], '활동유형': temp['활동유형']});
      String name = temp['활동명'];
      snamelist.add(name);
      schoolact.add(act);
    }

    var clubactlist = await FirebaseFirestore.instance.collection('users').doc(URL).collection('clubAct').get();

    for (int i = 0; i < clubactlist.docs.length; i++) {
      Map<String, dynamic> temp = clubactlist.docs[i].data();
      Map<String, dynamic> act = {};
      act.addAll({'구분': temp['구분'], '단체명': temp['단체명'],'직책': temp['직책'],'활동기간': temp['활동기간']});
      String name = temp['단체명'];
      cnamelist.add(name);
      clubact.add(act);
    }

    var volunteerlist = await FirebaseFirestore.instance.collection('users').doc(URL).collection('volunteer').get();

    for (int i = 0; i < volunteerlist.docs.length; i++) {
      Map<String, dynamic> temp = volunteerlist.docs[i].data();
      Map<String, dynamic> act = {};
      act.addAll({'구분': temp['구분'], '봉사기간': temp['봉사기간'],'봉사시간': temp['봉사시간'],'봉사장소': temp['봉사장소'], '봉사활동명': temp['봉사활동명'], '확인기관' : temp['확인기관']});
      String name = temp['봉사활동명'];
      vnamelist.add(name);
      volunteer.add(act);
    }

    var extraactlist = await FirebaseFirestore.instance.collection('users').doc(URL).collection('extraAct').get();

    for (int i = 0; i < extraactlist.docs.length; i++) {
      Map<String, dynamic> temp = extraactlist.docs[i].data();
      Map<String, dynamic> act = {};
      act.addAll({
        '대회기관': temp['대회기관'],
        '대회명': temp['대회명'],
        '수상실적': temp['수상실적'],
        '주최기관': temp['주최기관'],
      });
      String name = temp['대회명'];
      enamelist.add(name);
      extraact.add(act);
    }

    print(username);
    print(URL);
    return extraact;


    //NFT.add(NFT_Information);
    //NFT.add(NFT_Information_2);

    //var NFT_Collection = await FirebaseFirestore.instance.collection('NFT_Information');
/*
    for(int i = 0; i < NFT.length; i++)
    {
      NFT_Collection.doc(NFT[i][0].toString()).set(
          {
            'id' : NFT[i][0].toString(),
            'Name' : NFT[i][1].toString(),
            'Kind' : NFT[i][2].toString(),
            'Beginning' : NFT[i][3].toString(),
            'Ending' : NFT[i][4].toString(),
            'Place' : NFT[i][5].toString(),
            'Level' : NFT[i][6].toString(),
            'PAM' : NFT[i][7].toString(),
            'is_Sell' : NFT[i][8].toString(),
          }
      );
    }*/
  }


  @override
  Widget build(BuildContext context) {

    //build될 때 data 불러오는 함수들 실행

    future_profile = getprofileData();
    future_activity = getactData();


    print(username);
    print(id);
    print(major);

    return Scaffold(
      body: FutureBuilder<dynamic>(
          future: future_activity,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.hasData)
            {
              return ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  _Build_First(),
                  MajorandID(),
                  Career(),
                  NFT_Page(),
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

  Widget _Build_First() { //프로필 윗 부분

    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 244 * Factor_Height,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: (145 * Factor_Height + 28.6),
                        color: Colors.white,
                      ),
                      Container(
                        height: (145 * Factor_Height + 28.6),
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
                ],
              ),
            ),
            Positioned(
              top: 128 * Factor_Height,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0 * Factor_Width),
                height: 120 * Factor_Height,
                width: 120 * Factor_Height,
                child: Container(
                  child: ClipPolygon(
                    sides: 6,
                    borderRadius: 15.0, // Default 0.0 degrees
                    rotate: 90.0, // Default 0.0 degrees
                    child: Image.asset(Profile_path!,
                        height: 91 * Factor_Height, width: 91 * Factor_Height),
                  ),
                  decoration: ShapeDecoration(
                    shape: PolygonBorder(
                      sides: 6,
                      borderRadius: 15.0,
                      rotate: 90.0,
                      border: BorderSide(color: Color(0xFFFAFAFA), width: 6),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          height: 30 * Factor_Height,
          margin: EdgeInsets.symmetric(horizontal: 18.0 * Factor_Width),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                username!,
                style: TextStyle(
                  fontFamily: 'Spoqa-Bold',
                  fontSize: 24 * Factor_Height,
                ),
              ),
              Spacer(),
              Container(
                  height: 18 * Factor_Height,
                  width: 16 * Factor_Height,
                  child: Image.asset('assets/coins 1.png')),
              Container(width: 5 * Factor_Height),
              Container(
                height: 23 * Factor_Height,
                width: 75 * Factor_Height,
                child: Text(
                  'PAM 320',
                  style: TextStyle(
                    fontFamily: 'Spoqa-Bold',
                    fontSize: 18 * Factor_Height,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 18.0 * Factor_Width),
          height: 18 * Factor_Height,
          child: Text(
            '@' + NickName_Split!,
            style: TextStyle(
              fontFamily: 'Spoqa-Medium',
              fontSize: 14 * Factor_Height,
              color: Color(0xFF7C7C7C),
            ),
          ),
        ),
        Container(
          height: 24 * Factor_Height,
        ),
        Container(
          height: 45 * Factor_Height,
          margin: EdgeInsets.symmetric(horizontal: 18.0 * Factor_Width),
          child: Expanded(
            child: Text(
              introduce!,
              style: TextStyle(
                fontFamily: 'Spoqa-Medium',
                fontSize: 16 * Factor_Height,
              ),
            ),
          ),
        ),
        Container(
          height: 16 * Factor_Height,
        ),
        GestureDetector( //프로필 편집 버튼
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile_Edit_Page()),
            );
          },
          child: Container(
            height: 30 * Factor_Height,
            margin: EdgeInsets.symmetric(horizontal: 18.0 * Factor_Width),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Center(
                child: Text(
                  '프로필 편집',
                  style: TextStyle(
                    fontFamily: 'Spoqa-Medium',
                    fontSize: 15 * Factor_Height,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 14 * Factor_Height,
        ),
        Container(
          height: 70 * Factor_Height,
          margin: EdgeInsets.symmetric(horizontal: 11.0 * Factor_Width),
          child: Row(
            children: [
              Container(
                child: ClipPolygon(
                  sides: 6,
                  borderRadius: 15.0, // Default 0.0 degrees
                  rotate: 90.0, // Default 0.0 degrees
                  boxShadows: [
                    PolygonBoxShadow(color: Colors.grey, elevation: 5.0),
                  ],
                  child: Image.asset('assets/NFT_1.png',
                      height: 91 * Factor_Height, width: 91 * Factor_Height),
                ),
              ),
              Container(
                child: ClipPolygon(
                  sides: 6,
                  borderRadius: 15.0, // Default 0.0 degrees
                  rotate: 90.0, // Default 0.0 degrees
                  boxShadows: [
                    PolygonBoxShadow(color: Colors.grey, elevation: 5.0),
                  ],
                  child: Image.asset('assets/NFT_2.png',
                      height: 91 * Factor_Height, width: 91 * Factor_Height),
                ),
              ),
              Container(
                child: ClipPolygon(
                  sides: 6,
                  borderRadius: 15.0, // Default 0.0 degrees
                  rotate: 90.0, // Default 0.0 degrees
                  boxShadows: [
                    PolygonBoxShadow(color: Colors.grey, elevation: 5.0),
                  ],
                  child: Image.asset('assets/NFT_3.png',
                      height: 91 * Factor_Height, width: 91 * Factor_Height),
                ),
              ),
              Container(
                child: ClipPolygon(
                  sides: 6,
                  borderRadius: 15.0, // Default 0.0 degrees
                  rotate: 90.0, // Default 0.0 degrees
                  boxShadows: [
                    PolygonBoxShadow(color: Colors.grey, elevation: 5.0),
                  ],
                  child: Image.asset('assets/NFT_4.png',
                      height: 91 * Factor_Height, width: 91 * Factor_Height),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 13 * Factor_Height,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFDCDCDC)),
            ),
          ),
        ),
      ],
    );
  }
  Widget MajorandID(){

    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    String? ID = URL![2].toString() + URL![3].toString();

    return Column(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        Container(

            height: 20 * Factor_Height
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 18 * Factor_Width),
            height: 77 * Factor_Height,
            child: Row(
              children: [
                Container(

                  width: 120 * Factor_Width,
                  child: Text(
                    '$ID학번\n$major',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Spoqa-Bold',
                      fontSize: 20 * Factor_Height,
                      height: 1.2,),
                  ),
                ),
                Spacer(),
                Container(
                  child: ClipPolygon(
                    sides: 6,
                    borderRadius: 5.0, // Default 0.0 degrees
                    rotate: 90.0, // Default 0.0 degrees
                    boxShadows: [
                      PolygonBoxShadow(color: Colors.grey, elevation: 5.0),
                    ],
                    child: Image.asset('$major_image',
                        height: 77 * Factor_Height, width: 77 * Factor_Height),
                  ),
                ),
              ],
            )
        ),
        Container(
          height: 20 * Factor_Height,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFDCDCDC)),
            ),
          ),
        )
      ],
    );
  }

  Widget Career() {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;


    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          height: 3 * Factor_Height,
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [

              Container(
                  width: 18 * Factor_Width
              ),

              Column(
                //교내활동 이력

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 15 * Factor_Height,
                  ),
                  Container(
                    height: 22 * Factor_Height,
                    child: Text(
                      '교내활동 이력',
                      style: TextStyle(
                          fontFamily: 'Spoqa-Bold',
                          fontSize: 18 * Factor_Height),
                    ),
                  ),
                  Container(
                    height: 8 * Factor_Height,
                  ),
                  for (var i in snamelist)
                    Container(
                      height: 22 * Factor_Height,
                      child: Text(
                        i,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Spoqa-Medium',
                          fontSize: 16 * Factor_Height,
                          height: 1.2,),
                      ),
                    ),
                  if (snamelist.length == 0)
                    Text(
                      '교내활동 이력이 없습니다.',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Spoqa-Medium',
                        fontSize: 16 * Factor_Height,
                        height: 1.2,),
                    ),
                  Container(height: 15 * Factor_Height),
                  Container(
                    height: 22 * Factor_Height,
                    child: Text(
                      '학생단체 활동 이력 ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Spoqa-Bold',
                          fontSize: 18 * Factor_Height),
                    ),
                  ),
                  Container(
                    height: 8 * Factor_Height,
                  ),
                  for (var i in cnamelist)
                    Container(
                      height: 22 * Factor_Height,
                      child: Text(
                        i,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Spoqa-Medium',
                            fontSize: 16 * Factor_Height),
                      ),
                    ),
                  if (cnamelist.length == 0)
                    Text(
                      '학생단체 활동 이력이 없습니다.',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Spoqa-Medium',
                          fontSize: 16 * Factor_Height),
                    ),
                  Container(
                    height: 15 * Factor_Height,
                  ),
                  Container(
                    height: 22 * Factor_Height,
                    child: Text(
                      '봉사활동 이력',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Spoqa-Bold',
                          fontSize: 18 * Factor_Height),
                    ),
                  ),
                  Container(
                    height: 8 * Factor_Height,
                  ),
                  for (var i in vnamelist)
                    Container(
                      height: 22 * Factor_Height,
                      child: Text(
                        i,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Spoqa-Medium',
                            fontSize: 16 * Factor_Height),
                      ),
                    ),
                  if (vnamelist.length == 0)
                    Text(
                      '봉사활동 이력이 없습니다.',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Spoqa-Medium',
                          fontSize: 16 * Factor_Height),
                    ),
                  Container(height: 15 * Factor_Height),
                  Container(
                    height: 22 * Factor_Height,
                    child: Text(
                      '대외활동 이력',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Spoqa-Bold',
                          fontSize: 18 * Factor_Height),
                    ),
                  ),
                  Container(
                    height: 8 * Factor_Height,
                  ),
                  for (var i in enamelist)
                    Container(
                      height: 22 * Factor_Height,
                      child: Text(
                        i,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Spoqa-Medium',
                          fontSize: 16 * Factor_Height,
                          height: 1.2,),
                      ),
                    ),
                  if (enamelist.length == 0)
                    Text(
                      '대외활동 이력이 없습니다.',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Spoqa-Medium',
                          fontSize: 16 * Factor_Height),
                    ),
                ],
              ),
              Container(width: 18 * Factor_Width),
            ],
          ),
        ),
      ],
    );
  }


  Widget NFT_Page()
  {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(height: 15 * Factor_Height),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 18 * Factor_Width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 22 * Factor_Height,
                child: Text(
                  'NFT',
                  style: TextStyle(
                      fontFamily: 'Spoqa-Bold',
                      fontSize: 18 * Factor_Height),
                ),
              ),
              Container(height: 8 * Factor_Height),
              Stack(
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
                          offset: Offset(0.0, 4.0), //(x,y)
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
                        child: Image.asset('assets/NFT_1.png'),
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}