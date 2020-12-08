import 'package:flutter/material.dart';

import './questions.dart';
import './answers.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What course are you studying in SOC',
        'answers': [
          'Computer Science',
          'Information Security',
          'Information Systems',
          'Business Analytics',
          'Computer Engineering'
        ]
      },
      {
        'questionText': 'What year of study are you in',
        'answers': ['Year1', 'Year2', 'Year3', 'Year4']
      },
      {
        'questionText': 'What is your current CAP',
        'answers': [
          '4.50 and above',
          '4.00 – 4.49',
          '3.50 – 3.99',
          '3.00 – 3.49',
          '2.00 – 2.99'
        ]
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText']),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answers) {
              return Answers(_answerQuestion, answers);
            }).toList()
          ],
        ),
      ),
    );
  }
}
