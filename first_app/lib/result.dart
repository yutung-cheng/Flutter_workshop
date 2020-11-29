import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  //final Function restHandler;

  Result(this.resultScore);

  String get resultPhrase {
    var resultText = 'Finished!';
    if (resultScore < 8) {
      resultText = 'You are awesome!';
    } else if (resultScore <= 12) {
      resultText = 'You are great!';
    } else if (resultScore <= 16) {
      resultText = 'You are weird!';
    } else {
      resultText = 'You are bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
