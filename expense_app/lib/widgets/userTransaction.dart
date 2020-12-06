import 'package:flutter/material.dart';
import './newTransaction.dart';
import './transactionList.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionStates createState() => _UserTransactionStates();
}

class _UserTransactionStates extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '01',
      title: "New shoes",
      amount: 19.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '02',
      title: "Weekly groceries",
      amount: 59.23,
      date: DateTime.now(),
    ),
    Transaction(
      id: '03',
      title: "New iphone",
      amount: 1299,
      date: DateTime.now(),
    ),
    Transaction(
      id: '04',
      title: "New imac",
      amount: 1699,
      date: DateTime.now(),
    ),
    Transaction(
      id: '05',
      title: "New ipod",
      amount: 399,
      date: DateTime.now(),
    ),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //pass down pointer
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
