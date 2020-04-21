import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final questionIndex;
  Quiz(
    {this.questions,
    this.answerQuestion,
    this.questionIndex,}
  );
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[questionIndex]['questionText']),
      ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((a) {
        return Answer(()=>answerQuestion(a['score']),a['text']);
      }).toList()
    ]);
  }
}