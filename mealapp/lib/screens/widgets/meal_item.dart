import 'package:flutter/material.dart';
import 'package:mealapp/screens/meal_details.dart';
import 'package:mealapp/screens/widgets/item_catalog.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:mealapp/models/meals.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});
  final Meal meal;

  String get mealafford {
    return '${meal.affordability.name.toUpperCase()} ';
  }

  void mealdatails(BuildContext context, Meal meal) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => MealDetails(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      margin: EdgeInsets.all(10),
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.onPrimaryContainer,

        borderRadius: BorderRadius.circular(10),
        onTap: () {
          mealdatails(context, meal);
        },
        child: Stack(
          clipBehavior: Clip.hardEdge,

          //fit: StackFit.loose,
          children: [
            FadeInImage(
              height: 200,
              width: double.infinity,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black45,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        ItemCatalog(
                          icon: Icons.timer_rounded,
                          text: ' ${meal.duration} Min',
                        ),
                        //SizedBox(height: 10,),
                        ItemCatalog(icon: Icons.attach_money, text: mealafford),
                        //SizedBox(height: 10,),
                        ItemCatalog(
                          icon: Icons.restaurant_menu,
                          text: ' ${meal.complexity.name.toUpperCase()} ',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
