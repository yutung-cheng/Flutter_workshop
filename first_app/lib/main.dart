import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var questionIndex = 0;

  void onClick() {
    questionIndex = questionIndex + 1;
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "What's your favorite animal?",
      "What's your favorite color?",
      "What's your favorite NBA team?"
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Text(
              questions.elementAt(questionIndex),
            ),
            RaisedButton(
              child: Text('Tiger'),
              onPressed: () => print('Tiger'),
            ),
            RaisedButton(
              child: Text('Lion'),
              onPressed: () => print('Lion'),
            ),
            RaisedButton(
              child: Text('Cat'),
              onPressed: () => print('Dog'),
            )
          ],
        ),
      ),
    );
  }
}
