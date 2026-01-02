import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';


class CheckItem extends StatelessWidget {
  const CheckItem({
    
    super.key,
   required this.isCorrect,
    required this.questionNo
    
    });
    final bool isCorrect;
    final int questionNo;
    
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 30,
          width: 30,
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isCorrect? Color.fromARGB(255, 35, 209, 72):Color.fromARGB(255, 249, 133, 241),
            borderRadius: BorderRadius.circular(100)
          ),
          child: Text(questionNo.toString(),style: TextStyle(
            color:  Color.fromARGB(255, 129, 48, 125),fontWeight: FontWeight.bold,fontSize: 15
          ),textAlign: TextAlign.center,
          
          ),

    );
  }
}