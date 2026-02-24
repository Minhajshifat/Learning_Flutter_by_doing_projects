import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/data/data.dart';

final mealProvider = Provider((ref) {
  return dummyMeals;
});
