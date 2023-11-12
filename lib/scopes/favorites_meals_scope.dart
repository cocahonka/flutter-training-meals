import 'package:meals/models/meal.dart';

class FavoritesMealsState {
  const FavoritesMealsState({required this.favoritesMeals});

  final List<Meal> favoritesMeals;

  FavoritesMealsState copyWith({
    List<Meal>? favoritesMeals,
  }) {
    return FavoritesMealsState(
      favoritesMeals: favoritesMeals ?? this.favoritesMeals,
    );
  }
}
