import 'package:flutter/material.dart';
import './transcation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // This List / variable(transaction) will hold a list of Transcation
  final List<Transaction> transaction = [
    //Transaction(id: '11', "22");
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                color: Colors.blue,
                child: Text('Chart!'),
                elevation: 5,
              ),
              Card(
                color: Colors.blue,
                child: Text('List of TX!'),
              ),
            ],
          ),
        ));
  }
}
