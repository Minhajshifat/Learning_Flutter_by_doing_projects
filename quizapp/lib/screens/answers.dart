import 'package:flutter/material.dart';
//import 'package:quizapp/data/mcq.dart';









class Options extends StatelessWidget {
  const Options({
    super.key,
required this.txt,
required this.ontap,
    
    });
  final String txt;
  final void Function()ontap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: ontap, 
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 117, 54, 235),
      padding: EdgeInsets.symmetric(horizontal: 80),
      foregroundColor: const Color.fromARGB(255, 219, 216, 31),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
    
    child: Text(txt,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
    
    
    );
  }
}