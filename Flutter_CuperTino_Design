import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget
{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  var _isOn = false;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('4.10 CupperTino Design'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CupertinoSwitch(
              value: _isOn,
              onChanged: (bool value)
              {
                setState(() {
                  _isOn = value;
                });
              },
            ),
            CupertinoButton(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.pinkAccent,
              child: Text('Cupertino AlertDialog'),
              onPressed: () {_showCupertinoDialog();},
            ),
            CupertinoButton(
              child: Text('Cupertino Picker'),
              onPressed: () {_showCupertinoPicker();},
            ),
          ],

        ),
      ),
    );
  }
  _showCupertinoDialog()
  {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Are You Crazy?'),
        content: Text('If you are Crazy, Please press OK Botton'),
        actions: <Widget>[
          CupertinoDialogAction(
              child: Text('Cancel'),
          ),
          CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
          ),
        ],
      ),
    );
  }

  _showCupertinoPicker () async
  {
    final _items = List.generate(10, (i) => i);
    var result = _items[0];

    await showCupertinoModalPopup(
        context: context,
        builder: (context) => Container(
          height: 200.0,
          child: CupertinoPicker(
            children: _items.map((e) => Text('No. $e')).toList(),
            itemExtent: 50.0,
            onSelectedItemChanged: (int value)
              {
                result = _items[value];
              }
          )
        )
    );
    print(result);
  }
}
