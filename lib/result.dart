import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 8){
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 12){
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 25){
      resultText = 'Rebellious Soul';
    } else {
      resultText = 'You are a bad person!';
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Center (
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style:
            TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Reset Quiz'), onPressed: resetHandler ,
          )
        ],
      ),
    );
  }
}
