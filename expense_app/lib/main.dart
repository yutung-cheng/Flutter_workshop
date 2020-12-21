import 'package:flutter/material.dart';

import './widgets/transactionList.dart';
import './widgets/newTransaction.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.redAccent[700],
        fontFamily: 'Anids',
        //for AppBar only
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'Andis',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        //for rest of the App
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'Andis',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: '01',
    //   title: "New shoes",
    //   amount: 19.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '02',
    //   title: "Weekly groceries",
    //   amount: 59.23,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '03',
    //   title: "New iphone",
    //   amount: 1299,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '04',
    //   title: "New imac",
    //   amount: 1699,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '05',
    //   title: "New ipod",
    //   amount: 399,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transaction) {
      // if transaction.date is after other, will return true
      return transaction.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList(); //where return an iteration. add toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      // add function changes the existing list but not change the pointer
      _userTransactions.add(newTx);
    });
  }

  void _processAddNewTransaction(BuildContext ctx) {
    //fn provides by Fluuter
    showModalBottomSheet(
      //1. value of the context
      context: ctx,
      //2. builder needs to return a widget that should be inside of the modal bottom sheet
      builder: (_) {
        {
          return Stack(
            //Stack gives NewTransactoin a Radius.circular
            children: <Widget>[
              Container(
                height: 30.0,
                width: double.infinity,
                color: Colors.black54,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )),
              ),
              Container(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 33.0, bottom: 33.0),
                  child: (NewTransaction(_addNewTransaction)),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _processAddNewTransaction(context),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(_recentTransactions),
              TransactionList(_userTransactions)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _processAddNewTransaction(context),
      ),
    );
  }
}
