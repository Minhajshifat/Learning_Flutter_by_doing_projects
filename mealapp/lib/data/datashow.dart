import 'package:flutter/material.dart';
import 'package:mealapp/models/category.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.category,
    required this.Selected_Category_Meals,
  });
  final Category category;
  final void Function() Selected_Category_Meals;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: Selected_Category_Meals,
      splashColor: Theme.of(context).colorScheme.onPrimaryContainer,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
