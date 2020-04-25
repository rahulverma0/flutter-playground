import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  TransactionList(this._userTransactions);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: this._userTransactions.map((tx) {
        return Card(
            child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.purple,
                width: 2,
              )),
              padding: EdgeInsets.all(10),
              child: Text(
                '\$${tx.amount}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tx.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
                Text(
                  DateFormat.yMMMd().format(tx.date),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.grey),
                ),
              ],
            )
          ],
        ));
      }).toList(),
    );
  }
}
