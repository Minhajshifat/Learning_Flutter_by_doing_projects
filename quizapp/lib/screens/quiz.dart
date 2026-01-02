import 'package:flutter/material.dart';

class Quizhero extends StatelessWidget {
  const Quizhero(this.startquiz, {super.key});
  final void Function() startquiz;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 90),
        Center(
          child: Image(
            image: AssetImage('assets/images/quiz-logo.png'),
            width: 350,
          ),
        ),
        SizedBox(height: 60),
        Center(
          child: Text(
            'Learn Flutter Fun Way !',
            style: TextStyle(
              color: Colors.white54,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(height: 60),
        OutlinedButton.icon(
          onPressed: () {
            startquiz();
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,

            //shape:OutlinedBorder()
          ),
          //autofocus:true,
          icon: Icon(Icons.arrow_right_alt_outlined, color: Colors.white70),
          label: Text('Start Quiz'),
        ),
      ],
    );
  }
}
