import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/providers/complexprovider.dart';

import 'package:mealapp/providers/filter_meal_provider.dart';

import 'package:mealapp/screens/filter_screen.dart';
import 'package:mealapp/screens/home.dart';
import 'package:mealapp/screens/meal.dart';
import 'package:mealapp/screens/widgets/mydrawer.dart';

class TabBaritem extends ConsumerStatefulWidget {
  const TabBaritem({super.key});

  @override
  ConsumerState<TabBaritem> createState() => _TabBaritemState();
}

class _TabBaritemState extends ConsumerState<TabBaritem> {
  int selectedindex = 0;

  void ontabbar(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  void onslecteddrawer(String screen) async {
    Navigator.of(context).pop();
    if (screen == "Filter") {
      //filter
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => const FilterScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final mainmeal = ref.watch(mealProvider);
    // final activefilter = ref.watch(filterMealProvider);
    // //filter part
    // final filterSelectedData = mainmeal.where((meal) {
    //   if (activefilter[Filter.glutenfree]! && !meal.isGlutenFree) {
    //     return false;
    //   }
    //   if (activefilter[Filter.vegan]! && !meal.isVegan) {
    //     return false;
    //   }
    //   if (activefilter[Filter.vegeterian]! && !meal.isVegetarian) {
    //     return false;
    //   }
    //   if (activefilter[Filter.lactosefree]! && !meal.isLactoseFree) {
    //     return false;
    //   }
    //   return true;
    // }).toList();
    final activeemeal = ref.watch(filteredMealsProvider);
    Widget activePage = Homescreen(filtermeal: activeemeal); //filter data

    var activePageTitle = 'Categories';

    if (selectedindex == 1) {
      final favoritemeal = ref.watch(mealComplexProvider);
      activePage = MealShow(mealsdata: favoritemeal);
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.greenAccent,
        currentIndex: selectedindex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
        onTap: ontabbar,
      ),
      body: activePage,
      drawer: Mydrawer(onslectedscreen: onslecteddrawer),
    );
  }
}
