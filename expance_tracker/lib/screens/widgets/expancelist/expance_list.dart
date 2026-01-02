import 'package:expance_tracker/models/expance.dart';
import 'package:expance_tracker/screens/widgets/expancelist/expance_item.dart';
import 'package:flutter/material.dart';

class ExpanceList extends StatelessWidget {
  const ExpanceList({
    super.key, 
    required this.expences,
    required this.onremoveData,
  });
  final void Function(Expance expance)onremoveData;
  final List<Expance> expences;
  
  

  @override
  Widget build(BuildContext context) {
    Widget maincontent=Center(child: Text("There is no Expance !! Add Expance some"),);
    if(expences.isNotEmpty){
      maincontent=ListView.builder(
      itemCount: expences.length,
      itemBuilder: (context, index) => Dismissible(
        onDismissed: (direction) {
          onremoveData(expences[index]);
        },
        key: ValueKey(expences[index]),
        child: ExpanceItem(expences[index]),
        


      ),
      
    );
    }
    return maincontent;
  }
}
