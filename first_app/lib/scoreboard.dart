import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  final int finalScore;
  final Function quizHandler;

  ScoreBoard(this.finalScore, this.quizHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            "Your totally score is $finalScore",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            '''

            
            Score <  8  ->  Awesome 
            Score < 12  ->  Great 
            Score < 16  ->  Weird 
            Score > 17  ->  Bad 
            ''',
            textAlign: TextAlign.left,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz',
            ),
            textColor: Colors.blue,
            onPressed: quizHandler,
          ),
        ],
      ),
    );
  }
}
