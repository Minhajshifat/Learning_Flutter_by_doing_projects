import 'package:flutter/material.dart';

import 'package:mealapp/models/meals.dart';
import 'package:mealapp/screens/widgets/meal_item.dart';

class MealShow extends StatelessWidget {
  const MealShow({super.key, this.title, required this.mealsdata});
  final String? title;
  final List<Meal> mealsdata;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: mealsdata.length,
      itemBuilder: (cnxt, index) => MealItem(meal: mealsdata[index]),
    );
    if (mealsdata.isEmpty) {
      content = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "NO data available",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
          Text(
            "There is no meals in this category",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ],
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: Center(child: content),
    );
  }
}
