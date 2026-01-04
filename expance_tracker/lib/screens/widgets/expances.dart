import 'package:expance_tracker/main.dart';
import 'package:expance_tracker/models/expance.dart';
import 'package:expance_tracker/screens/widgets/expancelist/expance_list.dart';
import 'package:expance_tracker/screens/widgets/newexpance.dart';
import 'package:flutter/material.dart';

class Expances extends StatefulWidget {
  const Expances({super.key});

  @override
  State<Expances> createState() => _ExpancesState();
}

class _ExpancesState extends State<Expances> {
  
  List<Expance>data=[
    Expance(title: "Onek taka gase",amount: 2000.00,date:DateTime.now(),category: Category.Chill),
    Expance(title: "Onek taka gase",amount: 200.00,date:DateTime.now(),category: Category.CoursePurchase),
    Expance(title: "Onek taka gase",amount: 20.00,date:DateTime.now(),category: Category.Food),
    Expance(title: "Onek taka gase",amount: 2.00,date:DateTime.now(),category: Category.PersonalInvestment),
    Expance(title: "Onek taka gase",amount: 000.00,date:DateTime.now(),category: Category.Chill),
  ];
  void adddata(Expance expance){
    setState(() {
       data.add(expance);
    });
   
  }
  void _addnewexpance(){
     showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder:(ctx)=>Newexpance(newdata: adddata,)
      
      );
  }
  //test
  void onremoveData(Expance expance){
    final indx=data.indexOf(expance);
    setState(() {
      data.remove(expance);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Expance deleting...",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontSize: 18,
      color: selected_color.error,
    ),),backgroundColor: Theme.of(context).cardTheme.color,
    duration: Duration(seconds: 3),
      
      action:SnackBarAction(label:"Undo delete",textColor: selected_color.onTertiaryFixed,backgroundColor:const Color.fromARGB(255, 149, 159, 216), onPressed:(){
      setState(() {
        data.insert(indx, expance);
      });
    }),
    
    
    )
    
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           title: Text(" Tali Khoroj"),
           

          actions: [
                   IconButton(onPressed: _addnewexpance, 
                   icon: Icon(Icons.add)),
           ],
        ),
        body: Column(
          children: [
           
           Expanded(child: ExpanceList(expences: data,onremoveData: onremoveData,))
          ],
        ),
      );
  
  }
}