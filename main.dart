import 'package:flutter/material.dart';
import 'package:tessproject/Home_Page.dart';
import 'actinfo.dart';
import 'infolist.dart';
import 'Profile_Page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDefault();
  runApp(MyApp());

}

Future<void> initializeDefault() async {
  FirebaseApp app = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  print('Initialized default app $app');
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'PAMPLENET',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFCD0051),
      ),
      //home: infolisttabbar(),
      //home: Profile_Page(),
      home: Home_Page(),
    );
  }
}