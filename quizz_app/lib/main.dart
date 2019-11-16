import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'green', 'score': 3},
        {'text': 'white', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'dog', 'score': 2},
        {'text': 'cat', 'score': 3},
        {'text': 'rabbit', 'score': 1},
        {'text': 'snakes', 'score': 10},
      ],
    },
    {
      'questionText': 'What\'s your favorite ice cream flavour?',
      'answers': [
        {'text': 'chocolate', 'score': 4},
        {'text': 'vanilla', 'score': 2},
        {'text': 'strawberry', 'score': 3},
        {'text': 'coconut', 'score': 5},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
      _totalScore += score;
    });
  }

  @override
  build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
