import 'package:expance_tracker/models/expance.dart';
import 'package:expance_tracker/screens/widgets/expancelist/expance_item.dart';
import 'package:flutter/material.dart';

class ExpanceList extends StatelessWidget {
  const ExpanceList({super.key, required this.expences});
  final List<Expance> expences;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      itemCount: expences.length,
      itemBuilder: (context, index) => ExpanceItem(expences[index]),
    );
  }
}
