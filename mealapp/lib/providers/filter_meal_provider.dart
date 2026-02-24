import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mealapp/providers/mealProvider.dart';

enum Filter { glutenfree, vegan, vegeterian, lactosefree }

class FilterMealClass extends StateNotifier<Map<Filter, bool>> {
  FilterMealClass()
    : super({
        Filter.glutenfree: false,
        Filter.vegan: false,
        Filter.vegeterian: false,
        Filter.lactosefree: false,
      });

  void setFilters(Filter filter, bool isactive) {
    state = {...state, filter: isactive};
  }

  void setFilter(Map<Filter, bool> chosenfilter) {
    state = chosenfilter;
  }
}

final filterMealProvider =
    StateNotifierProvider<FilterMealClass, Map<Filter, bool>>((ref) {
      return FilterMealClass();
    });
final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealProvider);
  final activeFilters = ref.watch(filterMealProvider);

  return meals.where((meal) {
    if (activeFilters[Filter.glutenfree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactosefree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegeterian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
