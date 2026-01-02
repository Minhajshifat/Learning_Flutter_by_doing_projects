import 'package:flutter/material.dart';
import 'package:quizapp/screens/answers.dart';
import 'package:quizapp/data/mcq.dart';











class Question extends StatefulWidget {
  const Question({
    super.key,
    required this.chosen
  });

  final void Function(String answer) chosen;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  var counter=0;
  void changingQuestion(String selected){
  widget.chosen(selected);

    setState(() {
      
      counter++;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    final options=questions[counter];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20,
          children: [
                  Text(options.text,style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center,),
                  ...options.mcqshuffle().map((answer){
                    return Options(txt: answer,ontap:(){
                      changingQuestion(answer);
                    },);
                  }
                  
                  
                  ),
        
                  
          ],
        ),
      ),
    );
  }
}