import 'package:flutter/material.dart';
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

class FavoritesMealsScope extends InheritedWidget {
  const FavoritesMealsScope({
    required this.data,
    required super.child,
    super.key,
  });

  final FavoritesMealsState data;

  static FavoritesMealsState watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FavoritesMealsScope>()!.data;
  }

  @override
  bool updateShouldNotify(covariant FavoritesMealsScope oldWidget) => oldWidget.data != data;
}
