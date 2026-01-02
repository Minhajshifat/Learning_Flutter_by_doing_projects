import 'package:flutter/material.dart';
import 'package:quizapp/data/mcq.dart';
import 'package:quizapp/screens/resultscreen.dart';
import 'package:quizapp/screens/question.dart';
import 'package:quizapp/screens/quiz.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String>chosenanswer=[];
  
  var activewidget='start-screen';
  
  void switchwidget(){
    setState(() {
      activewidget='quizscreen';
    });
  }
  void choice(String answer)
  {
    chosenanswer.add(answer);
    if(chosenanswer.length==questions.length)
    {
     setState(() {
       //chosenanswer=[];
       activewidget='result';
     });
    //print(answer);
    }
  }
    void restartQuiz() {
    setState(() {
      chosenanswer= [];
      activewidget = 'questions-screen';
    });}
  
  @override
  Widget build(BuildContext context) {
    Widget screenshow=Quizhero(switchwidget);
    if(activewidget=='quizscreen'){
      screenshow=Question(chosen: choice,);
    }else if(activewidget=='result')
    {
      screenshow=Resultscreen(chosenanswer:chosenanswer, onRestart:restartQuiz,);
    }
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 73, 44, 153),
          ),
          child:screenshow,
        ),
      ),
    );
  }
}
