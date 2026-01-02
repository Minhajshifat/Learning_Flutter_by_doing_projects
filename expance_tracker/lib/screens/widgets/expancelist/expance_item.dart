import 'package:expance_tracker/models/expance.dart';
import 'package:flutter/material.dart';

class ExpanceItem extends StatelessWidget {
  const ExpanceItem(this.expance,{super.key});
 final Expance expance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
      ),
      child: Card(
        child: Column(
          children: [
            Text(expance.title),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text('\$${expance.amount.toStringAsFixed(2)}'),
                Spacer(),
                //Text(expance.category.toString()),
                Spacer(),
                Row(
                  children: [
                    Icon(expanceicon[expance.category]),
                    Text(expance.datefixed),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}