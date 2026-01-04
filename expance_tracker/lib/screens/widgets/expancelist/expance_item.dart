import 'package:expance_tracker/main.dart';
import 'package:expance_tracker/models/expance.dart';
import 'package:flutter/material.dart';

class ExpanceItem extends StatelessWidget {
  const ExpanceItem(this.expance,{super.key});
 final Expance expance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 2,
      ),
      child: Card(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 6),
              child: Text(expance.title,style:Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 15,
                
              ),),
            ),
            
            Row(
                children: [
                 // Spacer(),
                  Text('\$${expance.amount.toStringAsFixed(2)}'),
                  //Spacer(),
                  //Text(expance.category.toString()),
                  Spacer(),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(expanceicon[expance.category]),
                        Text(expance.datefixed),
                      ],
                    ),
                  )
                ],
              ),
            
          ],
        ),
      ),
    );
  }
}