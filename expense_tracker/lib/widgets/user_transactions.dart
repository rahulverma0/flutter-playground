import '../models/transaction.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      title: 'New shoes',
      amount: 50.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'New Shirt',
      amount: 40.00,
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
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(this._addNewTransaction),
        TransactionList(this._userTransactions),
      ],
    );
  }
}
