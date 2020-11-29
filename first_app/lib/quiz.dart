import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  final int currentScore;

  Quiz(
      {@required this.answerQuestion,
      @required this.questionIndex,
      @required this.questions,
      @required this.currentScore});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList(),
        Text(
          "Your current score is $currentScore",
          style: TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
