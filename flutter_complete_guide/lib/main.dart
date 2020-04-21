import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
/*
void main() {
  runApp(MyApp());
}
*/

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//"_" prefixed to Class & function makes it private
class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  static const _questions = [
    {
      'questionText': 'What\'s your favorite color',
      'answers': [
        {'text': 'red', 'score': 10},
        {'text': 'blue', 'score': 5},
        {'text': 'orange', 'score': 2},
        {'text': 'black', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal',
      'answers': [
        {'text': 'Lion', 'score': 4},
        {'text': 'Dog', 'score': 10},
        {'text': 'cat', 'score': 6},
        {'text': 'cow', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite country',
      'answers': [
        {'text': 'US', 'score': 3},
        {'text': 'UK', 'score': 7},
        {'text': 'Canda', 'score': 10},
        {'text': 'Italy', 'score': 1},
      ],
    },
  ];
  var _totalScore=0;
  void _resetQuiz(){
    setState(() {
      this._totalScore=0;
      this.questionIndex=0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore +=score;
    setState(() {
      questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: questionIndex,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
