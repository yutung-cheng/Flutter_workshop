import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function switchHandler;

  TextControl(this.switchHandler);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Switch'),
      onPressed: switchHandler,
    );
  }
}
