import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/screens/summary/Check_item.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.maindata});
  final Map<String, Object> maindata;
  @override
  Widget build(BuildContext context) {
    final is_correct = maindata['Correctans'] == maindata['Userans'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckItem(
          isCorrect: is_correct,
          questionNo: (maindata['QuestionNo'] as int) + 1,
        ),
        SizedBox(width: 30),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maindata['Question'] as String,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Actual Answer : ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent,
                ),
              ),
              Text(
                maindata['Correctans'].toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "User Answer : ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent,
                ),
              ),

              Text(
                maindata["Userans"].toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ],
    );
  }
}
