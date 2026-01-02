import 'package:flutter/material.dart';
import 'package:quizapp/data/mcq.dart';
import 'package:quizapp/screens/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';
class Resultscreen extends StatelessWidget {
  const Resultscreen({super.key, required this.chosenanswer,required this.onRestart});
  final List<String> chosenanswer;
  final void Function() onRestart;
  


  List<Map<String,Object>>summerize(){
    final List<Map<String,Object>>summary=[];
     for(int i=0;i<questions.length;i++){
      summary.add(
        {
          'QuestionNo':i,
          'Question':questions[i].text,
          'Correctans':questions[i].answers[0],
          'Userans':chosenanswer[i],
        }
  
      );
     }
     return summary;
  }






  @override
  Widget build(BuildContext context) {
  final summarydata=summerize();
  final totallQA=chosenanswer.length;
  final correct=summarydata.where((data){
     return data['Correctans']==data['Userans'];
  }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //spacing: 20,
          children: [
            //SizedBox(height: 40),
            Text('You got $correct out of $totallQA question marks!', style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
            SizedBox(height: 30),
            QuestionSummary(summary: summerize()),
            SizedBox(height: 30),
             TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
