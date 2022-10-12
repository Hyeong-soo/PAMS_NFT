import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'FirstPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
        home: FirstPage(),
      );
  }
}