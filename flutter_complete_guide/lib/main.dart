import 'package:flutter/material.dart';
import './question.dart';
/*
void main() {
  runApp(MyApp());
}
*/

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}
//"_" prefixed to Class & function makes it private
class _MyAppState extends State<MyApp>{
  var questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      questionIndex += 1;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      'What\'s your favorite color',
      'What\'s your favorite animal',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(_questions[questionIndex]),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: _answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
