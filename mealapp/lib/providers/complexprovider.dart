import 'package:flutter_riverpod/legacy.dart';
import 'package:mealapp/models/meals.dart';

class Complexprovider extends StateNotifier<List<Meal>> {
  Complexprovider() : super([]);

  bool togglefavoritemeal(Meal meal) {
    final ismealavailable = state.contains(meal);
    if (ismealavailable) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final mealComplexProvider = StateNotifierProvider<Complexprovider, List<Meal>>((
  ref,
) {
  return Complexprovider();
});
