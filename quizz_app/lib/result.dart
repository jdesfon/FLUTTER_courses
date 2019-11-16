import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;

  Result(this.totalScore);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('You total score is: $totalScore'),
    );
  }
}
