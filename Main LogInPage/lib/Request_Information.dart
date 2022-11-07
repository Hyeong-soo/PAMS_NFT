import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'NFT_Reservation.dart';
import 'dart:io';
//import 'package:image/image.dart';

class Request_Information extends StatefulWidget {

  @override
  State<Request_Information> createState() => _Request_InformationState();
}

class NFT_Information
{
  XFile? PhotoFile;
  String? Activity_Name;
  String? Activity_Period;
  String? My_Role;
  String? PAMS_Exist;
  NFT_Information(this.PhotoFile, this.Activity_Name, this.Activity_Period, this.My_Role, this.PAMS_Exist);
}

class _Request_InformationState extends State<Request_Information> {

  var _NFT_NextController1 = TextEditingController();
  var _NFT_NextController2 = TextEditingController();
  var _NFT_NextController3 = TextEditingController();
  var _NFT_NextController4 = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? file;

  var uploading = false;

  pickImageFromGallery() async {
    Navigator.pop(context);
    XFile? imageFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      this.file = imageFile;
    });
  }

  captureImageWithCamera() async {
    Navigator.pop(context);
    XFile? imageFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      this.file = imageFile;
    });
  }

  @override
  void dispose()
  {
    _NFT_NextController1.dispose();
    _NFT_NextController2.dispose();
    _NFT_NextController3.dispose();
    _NFT_NextController4.dispose();
    super.dispose();
  }

  void _add_NFT_Information(NFT_Information information) {
    setState(() {
      FirebaseFirestore.instance.collection('NFT_Information').add(
          {
            'PhotoFile': information.PhotoFile,
            'Activity_Name': information.Activity_Name,
            'Activity_Period': information.Activity_Period,
            'My_Role': information.My_Role,
            'PAMS_Exist': information.PAMS_Exist,
          },
      );
      _NFT_NextController1.text = '';
      _NFT_NextController2.text = '';
      _NFT_NextController3.text = '';
      _NFT_NextController4.text = '';
    });
  }

  takeImage(mContext){
    return showDialog(
      context: mContext,
      builder: (context) {
        return SimpleDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          title: Text(
            'New Post',
            style: TextStyle(
              color: Color(0xFF3C3C3C),
              fontFamily: 'Spoqa-Bold',
            ),
          ),
          children: <Widget>[
            SimpleDialogOption(
              child: Text(
                '카메라로 이미지 찍기',
                style: TextStyle(color: Color(0xFF3C3C3C)),
              ),
              onPressed: captureImageWithCamera,
            ),
            SimpleDialogOption(
              child: Text(
                '갤러리에서 이미지 선택하기',
                style: TextStyle(color: Color(0xFF3C3C3C)),
              ),
              onPressed: pickImageFromGallery,
            ),
            SimpleDialogOption(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 375;
    final Factor_Width = deviceWidth/standardDeviceWidth;
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 812;
    final Factor_Height = deviceHeight/standardDeviceHeight;
    return GestureDetector(
      onTap: ()
      {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 32 * Factor_Height,
              ),
              Container(
                height: 43 * Factor_Height,
              ),
              Container(
                height: 25 * Factor_Height,
                margin: EdgeInsets.symmetric(horizontal: 26.0 * Factor_Width),
                child: Text(
                  'NFT 이미지',
                  style: TextStyle(
                    fontSize: 20 * Factor_Height,
                    fontFamily: 'Spoqa-Bold',
                    color: Color(0xFF3C3C3C),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                height: 1 * Factor_Height,
              ),
              Container(
                height: 15 * Factor_Height,
                margin: EdgeInsets.symmetric(horizontal: 27.0 * Factor_Width),
                child: Text(
                  'PNG or JPG 파일',
                  style: TextStyle(
                    fontSize: 12 * Factor_Height,
                    fontFamily: 'Spoqa-Regular',
                    color: Color(0xFF818181),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                height: 11 * Factor_Height,
              ),
              Center(
                child: Container(
                  width: 329 * Factor_Height,
                  height: 230 * Factor_Height,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFC0C0C0),
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: file == null
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 86 * Factor_Height,
                        ),
                        Container(
                          height: 48 * Factor_Height,
                          width: 48 * Factor_Height,
                          child: Image.asset('assets/Image_Icon.png', color: Color(0xFFDDDDDD), fit: BoxFit.fill),
                        ),
                        Container(
                          height: 13 * Factor_Height,
                        ),
                        Container(
                          height: 20 * Factor_Height,
                          child: Container(
                            width: 80 * Factor_Height,
                            child: GestureDetector(
                              onTap:(){
                                takeImage(context);
                              },
                              child: Stack(
                                children: [
                                  Center(
                                    child: Opacity(
                                      opacity: 0.73,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFCD0051),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        width: 80 * Factor_Height,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'Upload Image',
                                      style: TextStyle(
                                        fontSize: 10 * Factor_Height,
                                        fontFamily: 'Spoqa-Regular',
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
                          height: 53 * Factor_Height
                        ),
                      ],
                    )
                        : Image.file(File(file!.path))
                  ),
                ),
              ),
              Container(
                height: 48 * Factor_Height,
              ),
              Container(
                height: 25 * Factor_Height,
                margin: EdgeInsets.symmetric(horizontal: 26.0 * Factor_Width),
                child: Text(
              '활동명',
              style: TextStyle(
                fontSize: 20 * Factor_Height,
                fontFamily: 'Spoqa-Bold',
                color: Color(0xFF3C3C3C),
              ),
              textAlign: TextAlign.start,
                ),
              ),
              Container(
                height: 22 * Factor_Height,
              ),
              Container(
                height: 25 * Factor_Height,
                margin: EdgeInsets.symmetric(horizontal: 28.0 * Factor_Width),
                child: TextField(
              controller: _NFT_NextController1,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFCFCFCF),
                    ),
                ),
                hintStyle: TextStyle(
                  fontSize: 14.4 * Factor_Width,
                  fontFamily: "Spoqa-Regular",
                  color: Color(0xFF818181),
                ),
                hintText: "UGRP",
              ),
              style: TextStyle(
                fontSize: 14.4 * Factor_Width,
                fontFamily: "Spoqa-Regular",
                color: Color(0xFF3C3C3C),
              ),
                ),
              ),
              Container(
                height: 43 * Factor_Height,
              ),
              Container(
                height: 25 * Factor_Height,
                margin: EdgeInsets.symmetric(horizontal: 26.0 * Factor_Width),
                child: Text(
              '활동기간',
              style: TextStyle(
                fontSize: 20 * Factor_Height,
                fontFamily: 'Spoqa-Bold',
                color: Color(0xFF3C3C3C),
              ),
              textAlign: TextAlign.start,
                ),
              ),
              Container(
                height: 22 * Factor_Height,
              ),
              Container(
                height: 25 * Factor_Height,
                margin: EdgeInsets.symmetric(horizontal: 28.0 * Factor_Width),
                child: TextField(
              controller: _NFT_NextController2,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCFCFCF),
                  ),
                ),
                hintStyle: TextStyle(
                  fontSize: 14.4 * Factor_Width,
                  fontFamily: "Spoqa-Regular",
                  color: Color(0xFF818181),
                ),
                hintText: "2022년 4월 15일 ~ 2022년 12월 30일",
              ),
              style: TextStyle(
                fontSize: 14.4 * Factor_Width,
                fontFamily: "Spoqa-Regular",
                color: Color(0xFF3C3C3C),
              ),
                ),
              ),
              Container(
                height: 43 * Factor_Height,
              ),
              Container(
                height: 25 * Factor_Height,
                margin: EdgeInsets.symmetric(horizontal: 26.0 * Factor_Width),
                child: Text(
              '자신의 역할',
              style: TextStyle(
                fontSize: 20 * Factor_Height,
                fontFamily: 'Spoqa-Bold',
                color: Color(0xFF3C3C3C),
              ),
              textAlign: TextAlign.start,
                ),
              ),
              Container(
                height: 22 * Factor_Height,
              ),
              Container(
                height: 25 * Factor_Height,
                margin: EdgeInsets.symmetric(horizontal: 28.0 * Factor_Width),
                child: TextField(
              controller: _NFT_NextController3,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCFCFCF),
                  ),
                ),
                hintStyle: TextStyle(
                  fontSize: 14.4 * Factor_Width,
                  fontFamily: "Spoqa-Regular",
                  color: Color(0xFF818181),
                ),
                hintText: "저는 어플리케이션의 프론트엔드 개발을 맡았습니다",
              ),
              style: TextStyle(
                fontSize: 14.4 * Factor_Width,
                fontFamily: "Spoqa-Regular",
                color: Color(0xFF3C3C3C),
              ),
                ),
              ),
              Container(
                height: 43 * Factor_Height,
              ),
              Container(
                height: 25 * Factor_Height,
                margin: EdgeInsets.symmetric(horizontal: 26.0 * Factor_Width),
                child: Text(
              'PAMS 등록 유무',
              style: TextStyle(
                fontSize: 20 * Factor_Height,
                fontFamily: 'Spoqa-Bold',
                color: Color(0xFF3C3C3C),
              ),
              textAlign: TextAlign.start,
                ),
              ),
              Container(
                height: 22 * Factor_Height,
              ),
              Container(
                height: 25 * Factor_Height,
                margin: EdgeInsets.symmetric(horizontal: 28.0 * Factor_Width),
                child: TextField(
              controller: _NFT_NextController4,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCFCFCF),
                  ),
                ),
                hintStyle: TextStyle(
                  fontSize: 14.4 * Factor_Width,
                  fontFamily: "Spoqa-Regular",
                  color: Color(0xFF818181),
                ),
                hintText: "PAMS에 등록되어 있습니다",
              ),
              style: TextStyle(
                fontSize: 14.4 * Factor_Width,
                fontFamily: "Spoqa-Regular",
                color: Color(0xFF3C3C3C),
              ),
                ),
              ),
              Container(
                height: 52 * Factor_Height,
              ),
              Center(
                child: Container(
                  height: 53 * Factor_Height,
                  child: Container(
                width: 300 * Factor_Width,
                child: GestureDetector(
                  onTap:()
                  {
                    _add_NFT_Information(NFT_Information(
                      file,
                      _NFT_NextController1.text,
                      _NFT_NextController2.text,
                      _NFT_NextController3.text,
                      _NFT_NextController4.text,
                    ));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:
                          (context) => NFT_Reservation()),
                    );
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
                          'NFT 제작 요청하기',
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
              ),
              Container(
                height: 54 * Factor_Height,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
