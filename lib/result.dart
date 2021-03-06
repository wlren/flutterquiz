import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int result;
  final Function reset;

  String get resultString {
    var resultText = 'You did it!';
    if (result >= 12) {
      resultText = 'Ups la';
    } else if (result >= 10) {
      resultText = 'Good stuff';
    } else if (result >= 8) {
      resultText = 'Not bad';
    } else if (result >= 6) {
      resultText = 'Meh';
    } else {
      resultText = 'Ooft';
    }
    return resultText;
  }

  Result(this.result, this.reset);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(
          resultString,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          onPressed: reset,
          child: Text(
            'Restart quiz!',
          ),
          textColor: Colors.blue,
        )
      ]),
    );
  }
}
