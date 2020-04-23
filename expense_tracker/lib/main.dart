import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter app'),
        ),
        body: Column(
          children: <Widget>[
            Card(
              child: Text('Chart'),
            ),
            Card(
              child: Text('List of Transactions'),
            ),
          ],
        ),
      ),
    );
  }
}
