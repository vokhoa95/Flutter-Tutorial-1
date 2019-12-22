import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp>{
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
  final _questions = const [
    {
      'questionText':'What\'s your favorite color?',
      'answer':[
        {'text':'Black','score': 10},
        {'text':'Red','score': 5},
        {'text':'Green','score': 3},
        {'text':'White','score': 1}
        ],
    },
    {
      'questionText':'What\'s your favorite animal?',
      'answer':[
        {'text':'Shark','score': 10},
        {'text':'Cat','score': 5},
        {'text':'Dog','score': 3},
        {'text':'Bird','score': 1}
        ],
    },
    {
      'questionText':'What\'s your favorite subject?',
      'answer':[
        {'text':'Music','score': 10},
        {'text':'English','score': 5},
        {'text':'Math','score': 3},
        {'text':'Literature','score': 1}
      ],
    },
  ];
  void _answerQuestion(int score){
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more question');
    } else {
      print('No more question');
    }
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(questions: _questions, answerQuestion: _answerQuestion, questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
        ),
      );
  }
}