import 'package:flutter/material.dart';

class TextShow extends StatelessWidget {
  final String textOutput;
  final int textNum;

  TextShow(this.textNum, this.textOutput);
  @override
  Widget build(BuildContext context) {
    return Text(
      '$textOutput',
      style: TextStyle(fontSize: 25),
    );
  }
}
