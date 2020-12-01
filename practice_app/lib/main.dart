import 'package:flutter/material.dart';
import 'package:practice_app/textControl.dart';
import './textShow.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _textPhrase = [
    "This is first Text",
    "This is second Text",
    "This is third Text"
  ];
  int _textSwitch = 0;
  String _tempText = '';

  void _switchText() {
    setState(() {
      if (_textSwitch < _textPhrase.length) {
        _tempText = _textPhrase[_textSwitch];
        _textSwitch += 1;
      } else {
        _textSwitch = 0;
        _tempText = 'Press to switch Text!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Center(
          child: Container(
              width: double.infinity,
              color: Colors.black26,
              child: Column(
                children: [
                  TextShow(_textSwitch, _tempText),
                  TextControl(_switchText),
                ],
              )),
        ),
      ),
    );
  }
}
