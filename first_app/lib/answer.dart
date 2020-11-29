import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHander;
  final String answerText;

  Answer(this.selectHander, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.black54,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: selectHander,
      ),
    );
  }
}
