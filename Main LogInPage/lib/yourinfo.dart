import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class yourinfo extends StatefulWidget {
  @override
  _yourinfoState createState() => _yourinfoState();
}

class user_Information {
  String? Name;
  String? Nickname;
  String? povis_ID;

  user_Information(this.Name, this.Nickname, this.povis_ID);
}

class _yourinfoState extends State<yourinfo> {

  final NameController = TextEditingController();
  final NicknameController = TextEditingController();
  final IDController = TextEditingController();

  @override

  void dispose() {
    NameController.dispose();
    NicknameController.dispose();
    IDController.dispose();
    super.dispose();
  }

  void _add_Information(user_Information information)
  {
    setState(() {
      FirebaseFirestore.instance.collection('Profile').add(
          {'Name' : information.Name, 'Nickname' : information.Nickname, 'POVIS ID' : information.povis_ID }
      );
      NameController.text = '';
      NicknameController.text = '';
      IDController.text = '';
    });
  }

  Widget build(BuildContext context) {

    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth / standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight / standardDeviceHeight;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // '당신은 어떤 사람인가요?' 텍스트
              height: 32 * Factor_Height,
              child: Text(
                '프로필 설정하기',
                style: TextStyle(
                  fontSize: 30 * Factor_Height,
                  fontFamily: 'Spoqa-Bold',
                  color: Color(0xFF3C3C3C),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                height: 32 * Factor_Height
            ),
            Container(
              height: 70 * Factor_Height,
              child: Text(
                '당신은 어떤 사람인가요?\n이름, 닉네임, POVIS 아이디 등\n기본 정보를 기입해주세요!',
                style: TextStyle(
                  fontSize: 18 * Factor_Height,
                  fontFamily: 'Spoqa-Medium',
                  color: Color(0xFF797979),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 34 * Factor_Height,
            ),
            Container(
              height: 53 * Factor_Height,
              width: 300 * Factor_Width,
              child: TextField(
                controller: NameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이름',
                ),
              ),
            ),
            Container(
              height: 34 * Factor_Height,
            ),
            Container(
              height: 53 * Factor_Height,
              width: 300 * Factor_Width,
              child: TextField(
                controller: NicknameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '닉네임',
                ),
              ),
            ),
            Container(
              height: 34 * Factor_Height,
            ),
            Container(
              height: 53 * Factor_Height,
              width: 300 * Factor_Width,
              child: TextField(
                controller: IDController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'POVIS 아이디',
                ),
              ),
            ),
            Container(
              height: 34 * Factor_Height,
            ),
            Container(
              height: 53 * Factor_Height,
              child: Container(
                width: 300 * Factor_Width,
                child: GestureDetector(
                  onTap: () {
                    _add_Information(user_Information(NameController.text, NicknameController.text, IDController.text));
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
                            width: 300 * Factor_Width,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          '저장',
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
      ),
    );
  }
}