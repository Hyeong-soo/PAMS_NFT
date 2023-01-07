import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';


Future<dynamic>? future_activity;

String? username;
String? grade;
String? major;
String? state;
String? major_image;
String? URL;
String? NickName_Split;
String? Profile_path = '1';
String? introduce = '';

List<dynamic> schoolact = [] as List<dynamic>;
List<dynamic> snamelist = [] as List<dynamic>;

List<dynamic> clubact = [] as List<dynamic>;
List<dynamic> cnamelist = [] as List<dynamic>;

List<dynamic> volunteer = [] as List<dynamic>;
List<dynamic> vnamelist = [] as List<dynamic>;

List<dynamic> extraact = [] as List<dynamic>;
List<dynamic> enamelist = [] as List<dynamic>;

List<List<dynamic>> NFT = [];
List<List<dynamic>> NFT_In = [];

List<bool> NFT_Like_Check = [];

 setinfo() async {

   final storage = FlutterSecureStorage();
   String? userInfo = await storage.read(key: "login");
   URL = userInfo!.split(" ")[1];
   var userdb = await FirebaseFirestore.instance.collection('users').doc(URL);
   
   userdb.collection('Profile').doc('Profile_path').update({
     "Profile_path" : Profile_path,
   });

   userdb.collection('Profile').doc('introduce').update({
     "introduce" : introduce,
   });


}

class Profile_Edit_Page extends StatefulWidget {
  const Profile_Edit_Page({Key? key}) : super(key: key);

  @override
  State<Profile_Edit_Page> createState() => _Profile_Edit_PageState();
}

class _Profile_Edit_PageState extends State<Profile_Edit_Page> {

  var _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    if(introduce == ' ') introduce = '한줄소개가 없습니다.';

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(height: 120 * Factor_Height),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0 * Factor_Width),
            child: Text(
              'Profile NFT Select',
              style: TextStyle(
                  fontFamily: 'Spoqa-Bold', fontSize: 30 * Factor_Height),
            ),
          ),
          Container(
            height: 20 * Factor_Height,
          ),
          NFT.isEmpty
              ? Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0 * Factor_Width),
            child: Text(
              'NFT가 존재하지 않습니다.',
              style: TextStyle(
                fontSize: 20 * Factor_Height,
                fontFamily: 'Spoqa-Bold',
                color: Color(0xFF000000),
              ),
            ),
          )
              : Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0 * Factor_Width),
            child: Text(
              '프로필로 사용할 NFT를 지정해주세요!',
              style: TextStyle(
                fontSize: 20 * Factor_Height,
                fontFamily: 'Spoqa-Bold',
                color: Color(0xFF000000),
              ),
            ),
          ),
          Container(height: 10 * Factor_Height),
          Container(
            margin: EdgeInsets.fromLTRB(16 * Factor_Height, 0, 0, 0),
            height: 120 * Factor_Height,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0;
                i < NFT.length;
                i++) // NFT.length 0일 때 예외처리 안해줘도 되나?
                  Container(
                    height: 120 * Factor_Height,
                    width: 120 * Factor_Height,
                    child: GestureDetector(
                      child: Stack(
                        children: [
                          Container(
                            height: 100 * Factor_Height,
                            width: 100 * Factor_Height,
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
                            height: 100 * Factor_Height,
                            width: 100 * Factor_Height,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.network(NFT[i][3]),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              border: Border.all(color: Color(0xFFD4D4D4)),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {

                        Profile_path = NFT[i][3];
                      },

                    ),
                  ),
              ],
            ),

          ),
          Container(height: 10 * Factor_Height),
          Container(
            height: 83 * Factor_Height, //"한줄소개"
            child: Column(
              children: [
                Container(
                    height: 28 * Factor_Height,
                    child: Row(
                      children: [
                        Container(
                          width: 16 * Factor_Width,
                        ),
                        Text(
                          '한줄소개',
                          style: TextStyle(
                            fontSize: 20 * Factor_Height,
                            fontFamily: 'Spoqa-Bold',
                            color: Color(0xFF000000),
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
                          width: 16 * Factor_Width,
                        ),
                        Expanded(
                          child: RichText(
                              overflow: TextOverflow.visible,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
                              text: TextSpan(
                                text: introduce!,
                                style: TextStyle(
                                  fontFamily: 'Spoqa-Medium',
                                  fontSize: 17.5 * Factor_Height,
                                  color: Color(0xFFCFCFCF),
                                ),
                              )
                          ),
                        ),
                      ],
                    )),
                Container(height: 10 * Factor_Height),
              ],
            ),
          ),
          Container(height: 20 * Factor_Height),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0 * Factor_Width),
            child: Text(
              '한줄소개 수정하기',
              style: TextStyle(
                fontSize: 20 * Factor_Height,
                fontFamily: 'Spoqa-Bold',

                color: Color(0xFF000000),
              ),
            ),
          ),
          Container(height: 10 * Factor_Height),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0 * Factor_Width),
            height: 60 * Factor_Height,
            child: TextField(
                autofocus: true,
                //expands: true,
                maxLength: 40,
                style: TextStyle(fontFamily: 'Spoqa-Medium'),
                textAlign: TextAlign.start,
                controller: _controller,
                decoration: InputDecoration(
                    labelStyle: TextStyle(fontFamily: 'Spoqa-Medium'),
                    labelText: '한줄소개 수정',
                    hintText: introduce!, // 원래 한줄소개, 글자를 입력하면 사라짐
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(fontFamily: 'Spoqa-Medium'),
                    contentPadding: EdgeInsets.all(8)),
                onChanged: (text) {
                  setState(() {
                    introduce = text; //바뀔 때마다 한줄소개 저장
                  });
                }),
          ),
          Container(height: 30,),
          Container( // '함께 뛰어들어가봅시다!' 버튼
            height: 53 * Factor_Height,
            child: Container(
              width: 343 * Factor_Width,
              child: GestureDetector(
                onTap:()
                {
                  Navigator.pop(context);
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
                          width: 343 * Factor_Width,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        '프로필 정보 수정하기',
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
          setinfo(), // setinfo 함수 호출로 정보 firebase에 설정
        ],
      ),
    );
  }
}

class Profile_Page extends StatefulWidget {
  String? ID_Prof;
  String? Nick;
  Profile_Page({this.ID_Prof, this.Nick});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page>
    with TickerProviderStateMixin {
  static final storage = FlutterSecureStorage();

  String? userInfo = '';
  String? NickName = '';

  //late TabController _tabController;

  void _add_Heart_Num(int i)
  {
    if(NFT[i][4] == true)
    {
      NFT[i][1] -= 1;
      NFT[i][4] = false;
    }
    else
    {
      NFT[i][1] += 1;
      NFT[i][4] = true;
    }
    FirebaseFirestore.instance.collection('users').doc(URL).collection('NFT').doc('NFT${i}').update(
        {
          'like_num' : NFT[i][1],
          'is_Checked' : NFT[i][4],
        }
    );
  }

  getactData() async{
    schoolact.clear();
    clubact.clear();
    volunteer.clear();
    extraact.clear();
    NFT.clear();
    NFT_In.clear();
    snamelist.clear();
    cnamelist.clear();
    vnamelist.clear();
    enamelist.clear();

    userInfo = await storage.read(key: "login");
    URL = userInfo!.split(" ")[1];
    NickName = await storage.read(key: "NickName");
    NickName_Split = NickName!.split(" ")[1];

    print(widget.ID_Prof);
    print(widget.Nick);

    if(widget.ID_Prof != null && widget.Nick != null)
    {
      URL = widget.ID_Prof;
      NickName_Split = widget.Nick;
    }

    var docsnapshot = await FirebaseFirestore.instance.collection('users').doc(URL).get(); //하태혁의 주소

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

    var NFT_s = await FirebaseFirestore.instance.collection('users').doc(URL).collection('NFT').get();
    for(int i = 0; i < NFT_s.docs.length; i++)
    {
      NFT_Like_Check.add(false);
      Map<String, dynamic> temp = NFT_s.docs[i].data();
      Map<String, dynamic> act = {};
      List<dynamic> Out = [];
      List<dynamic> In = [];
      act.addAll({
        'day_end' : temp['day_end'],
        'day_start' : temp['day_start'],
        'description' : temp['description'],
        'detail' : temp['detail'],
        'host' : temp['host'],
        'image' : temp['image'],
        'kind' : temp['kind'],
        'like_num' : temp['like_num'],
        'name' : temp['name'],
        'prize' : temp['prize'],
        'is_Checked' : temp['is_Checked'],
        'id' : temp['id'],
      });
      Out.add(temp['name']);
      Out.add(temp['like_num']);
      Out.add(temp['detail']);
      Out.add(temp['image']);
      Out.add(temp['is_Checked']);
      In.add(temp['name']);
      In.add(temp['like_num']);
      In.add(temp['detail']);
      In.add(temp['image']);
      In.add(temp['day_end']);
      In.add(temp['day_start']);
      In.add(temp['description']);
      In.add(temp['host']);
      In.add(temp['kind']);
      In.add(temp['prize']);
      In.add(temp['is_Checked']);
      In.add(temp['id']);
      NFT.add(Out);
      NFT_In.add(In);
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

    future_activity = getactData();

    print(username);
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
                    child: Profile_path == '1' ? Image.asset('assets/phonix.png',
                        height: 91 * Factor_Height, width: 91 * Factor_Height)
                        : Image.network(Profile_path!, height: 91 * Factor_Height, width: 91 * Factor_Height),
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    //shadows:
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
        widget.ID_Prof == null ? Container(
          height: 16 * Factor_Height,
        ) : Container(),
        widget.ID_Prof == null ? GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => Profile_Edit_Page()),
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
        ) : Container(),
        widget.ID_Prof == null ? Container(
          height: 14 * Factor_Height,
        ) : Container(),
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
                  child: Image.network(NFT[0][3],
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
                  child: Image.network(NFT[1][3],
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
                  child: Image.network(NFT[2][3],
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
                  child: Image.network(NFT[3][3],
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

                  width: 140 * Factor_Width,
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

  Widget odd_Row_Container(int length)
  {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //shrinkWrap: true,
      children: [
        for(int i = 0 ; i < length ~/ 2 ; i++)
          Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      child: Stack(
                        children: [
                          Container(
                            height: 163 * Factor_Height,
                            width: 163 * Factor_Height,
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
                          Container(height: 163 * Factor_Height, width: 163 * Factor_Height,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.network(NFT[2*i][3]),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              border: Border.all(color: Color(0xFFD4D4D4)),
                            ),
                          ),
                        ],
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            CupertinoPageRoute(builder:
                                (context) => Profile_Exactly_Page(NFT_In[2*i][11], 2*i)));
                      },
                    ),
                    Container(height: 5*Factor_Height),
                    Container(
                      width: 163 * Factor_Height,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(NFT[2*i][0], style: TextStyle(fontSize: 12, fontFamily: 'Spoqa-Bold'),),
                              Text(NFT[2*i][2], style: TextStyle(fontSize: 11, fontFamily: 'Spoqa-Medium', color: Colors.grey),)
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance.collection('users').doc(URL).collection('NFT').snapshots(),
                                  builder: (context, snapshot) {
                                    return GestureDetector(
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 16 * Factor_Height,
                                              height: 15 * Factor_Height,
                                              child: Image.asset('assets/heart (2).png')
                                          ),
                                          Text(NFT[2*i][1].toString(), style: TextStyle(fontSize: 10, fontFamily: 'Spoqa-Medium'),)
                                        ],
                                      ),
                                      onTap: () => _add_Heart_Num(2*i),
                                    );
                                  }
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(height: 10 * Factor_Height),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    GestureDetector(
                      child: Stack(
                        children: [
                          Container(
                            height: 163 * Factor_Height,
                            width: 163 * Factor_Height,
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
                          Container(height: 163 * Factor_Height, width: 163 * Factor_Height,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.network(NFT[2*i+1][3]),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              border: Border.all(color: Color(0xFFD4D4D4)),
                            ),
                          ),
                        ],
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            CupertinoPageRoute(builder:
                                (context) => Profile_Exactly_Page(NFT_In[2*i+1][11], 2*i+1)));
                      },
                    ),
                    Container(height: 5*Factor_Height),
                    Container(
                      width: 163 * Factor_Height,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(NFT[2*i+1][0], style: TextStyle(fontSize: 12, fontFamily: 'Spoqa-Bold'),),
                              Text(NFT[2*i+1][2], style: TextStyle(fontSize: 11, fontFamily: 'Spoqa-Medium', color: Colors.grey),)
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance.collection('users').doc(URL).collection('NFT').snapshots(),
                                  builder: (context, snapshot) {
                                    return GestureDetector(
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 16 * Factor_Height,
                                              height: 15 * Factor_Height,
                                              child: Image.asset('assets/heart (2).png') //: Image.asset('assets/heart (1).png'),
                                          ),
                                          Text(NFT[2*i+1][1].toString(), style: TextStyle(fontSize: 10, fontFamily: 'Spoqa-Medium'),)
                                        ],
                                      ),
                                      onTap: () => _add_Heart_Num(2*i + 1),
                                    );
                                  }
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(height: 10 * Factor_Height),
                  ],
                ),
              ]
          ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Stack(
                children: [
                  Container(
                    height: 163 * Factor_Height,
                    width: 163 * Factor_Height,
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
                  Container(height: 163 * Factor_Height, width: 163 * Factor_Height,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.network(NFT[length - 1][3]),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(color: Color(0xFFD4D4D4)),
                    ),
                  ),
                ],
              ),
              onTap: (){
                Navigator.push(
                    context,
                    CupertinoPageRoute(builder:
                        (context) => Profile_Exactly_Page(NFT_In[length-1][11], length-1)));
              },
            ),
            Container(height: 5*Factor_Height),
            Container(
              width: 163 * Factor_Height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(NFT[length - 1][0], style: TextStyle(fontSize: 12, fontFamily: 'Spoqa-Bold'),),
                      Text(NFT[length - 1][2], style: TextStyle(fontSize: 11, fontFamily: 'Spoqa-Medium', color: Colors.grey),)
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection('users').doc(URL).collection('NFT').snapshots(),
                          builder: (context, snapshot) {
                            return GestureDetector(
                              child: Column(
                                children: [
                                  Container(
                                      width: 16 * Factor_Height,
                                      height: 15 * Factor_Height,
                                      child: Image.asset('assets/heart (2).png') //: Image.asset('assets/heart (1).png'),
                                  ),
                                  Text(NFT[length - 1][1].toString(), style: TextStyle(fontSize: 10, fontFamily: 'Spoqa-Medium'),)
                                ],
                              ),
                              onTap: () => _add_Heart_Num(length - 1),
                            );
                          }
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(height: 10 * Factor_Height),
          ],
        ),
      ],
    );



  }

  Widget even_Row_Container(int length)
  {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //shrinkWrap: true,
      children: [
        for(int i = 0 ; i < length / 2 ; i++)
          Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      child: Stack(
                        children: [
                          Container(
                            height: 163 * Factor_Height,
                            width: 163 * Factor_Height,
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
                          Container(height: 163 * Factor_Height, width: 163 * Factor_Height,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.network(NFT[2*i][3]),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              border: Border.all(color: Color(0xFFD4D4D4)),
                            ),
                          ),
                        ],
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            CupertinoPageRoute(builder:
                                (context) => Profile_Exactly_Page(NFT_In[2*i][11], 2*i)));
                      },
                    ),
                    Container(height: 5*Factor_Height),
                    Container(
                      width: 163 * Factor_Height,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(NFT[2*i][0], style: TextStyle(fontSize: 12, fontFamily: 'Spoqa-Bold'),),
                              Text(NFT[2*i][2], style: TextStyle(fontSize: 11, fontFamily: 'Spoqa-Medium', color: Colors.grey),)
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance.collection('users').doc(URL).collection('NFT').snapshots(),
                                  builder: (context, snapshot) {
                                    return GestureDetector(
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 16 * Factor_Height,
                                              height: 15 * Factor_Height,
                                              child: Image.asset('assets/heart (2).png')
                                          ),
                                          Text(NFT[2*i][1].toString(), style: TextStyle(fontSize: 10, fontFamily: 'Spoqa-Medium'),)
                                        ],
                                      ),
                                      onTap: () => _add_Heart_Num(2*i),
                                    );
                                  }
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(height: 10 * Factor_Height),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    GestureDetector(
                      child: Stack(
                        children: [
                          Container(
                            height: 163 * Factor_Height,
                            width: 163 * Factor_Height,
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
                          Container(height: 163 * Factor_Height, width: 163 * Factor_Height,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.network(NFT[2*i+1][3]),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              border: Border.all(color: Color(0xFFD4D4D4)),
                            ),
                          ),
                        ],
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            CupertinoPageRoute(builder:
                                (context) => Profile_Exactly_Page(NFT_In[2*i+1][11], 2*i+1)));
                      },
                    ),
                    Container(height: 5*Factor_Height),
                    Container(
                      width: 163 * Factor_Height,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(NFT[2*i+1][0], style: TextStyle(fontSize: 12, fontFamily: 'Spoqa-Bold'),),
                              Text(NFT[2*i+1][2], style: TextStyle(fontSize: 11, fontFamily: 'Spoqa-Medium', color: Colors.grey),)
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance.collection('users').doc(URL).collection('NFT').snapshots(),
                                  builder: (context, snapshot) {
                                    return GestureDetector(
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 16 * Factor_Height,
                                              height: 15 * Factor_Height,
                                              child: Image.asset('assets/heart (2).png') //: Image.asset('assets/heart (1).png'),
                                          ),
                                          Text(NFT[2*i+1][1].toString(), style: TextStyle(fontSize: 10, fontFamily: 'Spoqa-Medium'),)
                                        ],
                                      ),
                                      onTap: () => _add_Heart_Num(2*i + 1),
                                    );
                                  }
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(height: 10 * Factor_Height),
                  ],
                ),
              ]
          ),
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


    var act_num = snamelist.length + cnamelist.length + vnamelist.length + enamelist.length; // 전체 활동 개수
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
              NFT_In.length.isOdd ? odd_Row_Container(NFT_In.length) : even_Row_Container(NFT_In.length),
            ],
          ),
        ),
      ],
    );
  }
}

class Profile_Exactly_Page extends StatefulWidget {
  String ID;
  int i;

  Profile_Exactly_Page(this.ID, this.i);

  @override
  State<Profile_Exactly_Page> createState() => _Profile_Exactly_PageState();
}

class _Profile_Exactly_PageState extends State<Profile_Exactly_Page> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    return ScaffoldGradientBackground(
      gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.white,
            Colors.pinkAccent,
          ],
          stops: [0.49, 0.8]
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 110 * Factor_Height),
          Stack(
            children: [
              Container(
                height: 275 * Factor_Height,
                width: 275 * Factor_Height,
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
              Container(height: 275 * Factor_Height, width: 275 * Factor_Height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(NFT[widget.i][3]),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(color: Color(0xFFD4D4D4)),
                ),
              ),
            ],
          ),
          Container(height: 25 * Factor_Height),
          Text(NFT[widget.i][0], style: TextStyle(fontFamily: 'Spoqa-Bold', fontSize: 30 * Factor_Height),),
          Text(NFT[widget.i][2], style: TextStyle(fontFamily: 'Spoqa-Medium', fontSize: 22 * Factor_Height, color: Colors.grey),),
          Container(height: 5 * Factor_Height),
          Icon(Icons.favorite, color: Colors.red, size: 23 * Factor_Height,),
          Text(NFT[widget.i][1].toString(), style: TextStyle(fontFamily: 'Spoqa-Medium', fontSize: 14 * Factor_Height),),
          Container(height: 25 * Factor_Height),
          RichText(
              overflow: TextOverflow.visible,
              maxLines: 2,
              textAlign: TextAlign.center,
              strutStyle: StrutStyle(fontSize: 11 * Factor_Height),
              text: TextSpan(
                text: NFT_In[widget.i][6],
                style: TextStyle(
                  fontFamily: 'Spoqa-Bold',
                  fontSize: 22 * Factor_Height,
                  color: Colors.black,
                ),
              )
          ),
          Container(height: 25 * Factor_Height),
          Text('NFT-ID: '+NFT_In[widget.i][11], style: TextStyle(fontFamily: 'Spoqa-Medium', fontSize: 18 * Factor_Height),),
          Container(height: 2 * Factor_Height),
          Text('kind: '+NFT_In[widget.i][8], style: TextStyle(fontFamily: 'Spoqa-Medium', fontSize: 18 * Factor_Height),),
          Container(height: 2 * Factor_Height),
          Text('prize: '+NFT_In[widget.i][9], style: TextStyle(fontFamily: 'Spoqa-Medium', fontSize: 18 * Factor_Height),),
          Container(height: 2 * Factor_Height),
          Text('host: '+NFT_In[widget.i][7], style: TextStyle(fontFamily: 'Spoqa-Medium', fontSize: 18 * Factor_Height),),
          Container(height: 2 * Factor_Height),
          Text('day_start: '+NFT_In[widget.i][5], style: TextStyle(fontFamily: 'Spoqa-Medium', fontSize: 18 * Factor_Height),),
          Container(height: 2 * Factor_Height),
          Text('day_end: '+NFT_In[widget.i][4], style: TextStyle(fontFamily: 'Spoqa-Medium', fontSize: 18 * Factor_Height),),
        ],
      ),
    );
  }
}

