import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      if (_questionIndex < 2) {
        _questionIndex =  _questionIndex + 1;
      } else {
        _questionIndex = 0;
      }
    });
  }

  @override
  build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers' : ['red', 'blue', 'green', 'yellow'],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['dog', 'cat', 'rabbit', 'pig'],
      },
      {
        'questionText': 'What\'s your favorite flavour?',
        'answers': ['chocolate', 'vanilla', 'strawberry', 'mint'],
      },
     ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
