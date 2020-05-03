import 'dart:io';
import 'package:flutter/cupertino.dart';

import '../models/transaction.dart';
import './chart.dart';
import './transaction_list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({
    Key key,
    @required this.recentTransactions,
    @required List<Transaction> userTransactions,
    @required this.deleteTransaction,
    @required this.startAddNewTransaction,
    @required this.refresh,
  })  : _userTransactions = userTransactions,
        super(key: key);
  final Function startAddNewTransaction;
  final Function refresh;
  final Function deleteTransaction;
  final List<Transaction> recentTransactions;
  final List<Transaction> _userTransactions;

  bool _showChart = false;
  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Expense Tracker'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => startAddNewTransaction(context),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text('Expense Tracker'),
            actions: <Widget>[
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    startAddNewTransaction(context);
                  },
                ),
              ),
            ],
          );
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final txListWidget = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.7,
      child: TransactionList(
        _userTransactions,
        deleteTransaction,
      ),
    );

    var pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Show Chart', style: Theme.of(context).textTheme.title),
                  Switch.adaptive(
                      value: true,
                      onChanged: (val) {
                        _showChart = val;
                        print(_showChart);
                        refresh();
                      })
                ],
              ),
            if (!isLandscape)
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(this.recentTransactions),
              ),
            if (!isLandscape) txListWidget,
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.3,
                      child: Chart(this.recentTransactions),
                    )
                  : txListWidget,
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : Builder(
                    builder: (context) => FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () => startAddNewTransaction(context),
                    ),
                  ),
          );
  }
}
