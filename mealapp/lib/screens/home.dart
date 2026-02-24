import 'package:flutter/material.dart';
import 'package:mealapp/data/data.dart';
import 'package:mealapp/data/datashow.dart';
import 'package:mealapp/models/category.dart';
import 'package:mealapp/models/meals.dart';
import 'package:mealapp/screens/meal.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key, required this.filtermeal});

  final List<Meal> filtermeal;
  void _Selected_Category_Meals(BuildContext context, Category category) {
    final filteredmeal = filtermeal
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (contx) =>
            MealShow(title: category.title, mealsdata: filteredmeal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
        ),
        children: [
          for (final cat in availableCategories)
            Categories(
              category: cat,
              Selected_Category_Meals: () {
                _Selected_Category_Meals(context, cat);
              },
            ),
        ],
      ),
    );
  }
}
