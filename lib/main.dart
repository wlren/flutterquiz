import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What course are you studying in SOC',
      'answers': [
        {'text': 'Computer Science', 'score': 2},
        {'text': 'Information Security', 'score': 2},
        {'text': 'Information Systems', 'score': 2},
        {'text': 'Business Analytics', 'score': 2},
        {'text': 'Computer Engineering', 'score': 2}
      ]
    },
    {
      'questionText': 'What year of study are you in',
      'answers': [
        {'text': 'Year 1', 'score': 0},
        {'text': 'Year 2', 'score': 0},
        {'text': 'Year 3', 'score': 0},
        {'text': 'Year 4', 'score': 0}
      ]
    },
    {
      'questionText': 'What is your current CAP',
      'answers': [
        {'text': '4.50 and above', 'score': 10},
        {'text': '4.00 – 4.49', 'score': 8},
        {'text': '3.50 – 3.99', 'score': 6},
        {'text': '3.00 – 3.49', 'score': 4},
        {'text': '2.00 – 2.99', 'score': 2},
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore),
      ),
    );
  }
}
