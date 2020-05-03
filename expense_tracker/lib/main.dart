import 'dart:io';

import 'package:flutter/cupertino.dart';

import './widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'widgets/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String titleInput, amountInput;
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
    Transaction(
      id: '3',
      title: 'Cable',
      amount: 5.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '4',
      title: 'Phone',
      amount: 400.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: '5',
      title: 'New Cap',
      amount: 4.20,
      date: DateTime.now(),
    ),
    Transaction(
      id: '6',
      title: 'New tie',
      amount: 10.00,
      date: DateTime.now(),
    ),
  ];

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  refresh() {
    print("state called");
    setState(() {});
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  List<Transaction> get recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (BuildContext bCtx) => Container(
        child: GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            theme: CupertinoThemeData(
              primaryColor: Colors.purple,
            ),
            home: Home(
                recentTransactions: recentTransactions,
                userTransactions: _userTransactions,
                deleteTransaction: _deleteTransaction,
                startAddNewTransaction: _startAddNewTransaction,
                refresh: refresh),
          )
        : MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.amber,
              errorColor: Colors.red,
              fontFamily: 'Quicksand',
              textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
              appBarTheme: AppBarTheme(
                textTheme: ThemeData.light().textTheme.copyWith(
                      title: TextStyle(
                        fontFamily: 'OpenSan',
                        fontSize: 20,
                      ),
                      button: TextStyle(color: Colors.white),
                    ),
              ),
            ),
            home: Home(
                recentTransactions: recentTransactions,
                userTransactions: _userTransactions,
                deleteTransaction: _deleteTransaction,
                startAddNewTransaction: _startAddNewTransaction,
                refresh: refresh),
          );
  }
}
