import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
import './scoreboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// _ -> turns to private property
class _MyAppState extends State<MyApp> {
  //or static const
  final _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 3},
        {'text': 'Red', 'score': 1},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 1},
        {'text': 'Elephant', 'score': 1},
        {'text': 'Lion', 'score': 2},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Jay', 'score': 3},
        {'text': 'Jolin', 'score': 2},
        {'text': 'SHE', 'score': 1},
        {'text': 'ATL', 'score': 1},
      ],
    },
    {
      'questionText': 'Who\'s your favorite team?',
      'answers': [
        {'text': 'Lakers', 'score': 2},
        {'text': 'Clippers', 'score': 0},
        {'text': 'Worriors', 'score': 3},
        {'text': '7Sixers', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    // if (_questionIndex < _questions.length) {}
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          //if statment ? Colmun(...) : Center(...)
          body: Column(
            children: [
              _questionIndex < _questions.length
                  ? Column(children: [
                      Quiz(
                          answerQuestion: _answerQuestion,
                          questionIndex: _questionIndex,
                          questions: _questions,
                          currentScore: _totalScore),
                    ])
                  // else statment
                  : Column(
                      children: [
                        Result(
                          _totalScore,
                        ),
                        ScoreBoard(
                          _totalScore,
                          _resetQuiz,
                        )
                      ],
                    ),
            ],
          )),
    );
  }
}
