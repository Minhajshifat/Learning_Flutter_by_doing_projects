import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/models/meals.dart';
import 'package:mealapp/providers/complexprovider.dart';

class MealDetails extends ConsumerStatefulWidget {
  const MealDetails({super.key, required this.meal});
  final Meal meal;

  @override
  ConsumerState<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends ConsumerState<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final isFavorite = ref
        .watch(mealComplexProvider)
        .any((meal) => meal.id == widget.meal.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.meal.title,
          style: TextStyle(
            fontSize: 25,
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final Is_Available = ref
                  .read(mealComplexProvider.notifier)
                  .togglefavoritemeal(widget.meal);
              if (Is_Available) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    padding: EdgeInsets.all(20),
                    duration: Duration(seconds: 2),
                    content: Text(
                      "Meal Added to favorite List",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text(
                      "Meal Removed from favorite List",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }
            },
            icon: Icon(
              Icons.star,
              color: isFavorite ? Colors.orange : Colors.white,
            ),
            splashColor: Colors.white,
            highlightColor: Colors.amber,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(widget.meal.imageUrl),
            SizedBox(height: 20),
            const Text(
              "Ingredence",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            for (var ind in widget.meal.ingredients)
              Text(
                ind,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            SizedBox(height: 20),
            Text(
              "Steps..",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            for (var step in widget.meal.steps)
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  step,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
