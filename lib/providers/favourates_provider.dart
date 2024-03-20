import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavourateMealsNotifier extends StateNotifier<List<Meal>> {
  FavourateMealsNotifier() : super([]);
  bool toggleMealFavourateStatus(Meal meal) {
    final mealIsFavourare = state.contains(meal);

    if (mealIsFavourare) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }

    //state = [];
  }
}

final favouarteMealsProvider =
    StateNotifierProvider<FavourateMealsNotifier, List<Meal>>((ref) {
  return FavourateMealsNotifier();
});
