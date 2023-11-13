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

class FavoritesMealsWidget extends StatefulWidget {
  const FavoritesMealsWidget({required this.child, super.key});

  final Widget child;

  // ignore: library_private_types_in_public_api
  static _FavoritesMealsWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<_FavoritesMealsWidgetState>()!;
  }

  @override
  State<FavoritesMealsWidget> createState() => _FavoritesMealsWidgetState();
}

class _FavoritesMealsWidgetState extends State<FavoritesMealsWidget> {
  var _data = const FavoritesMealsState(favoritesMeals: []);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = _data.favoritesMeals.contains(meal);

    setState(() {
      if (mealIsFavorite) {
        _data = _data.copyWith(
          favoritesMeals: _data.favoritesMeals.where((favoriteMeal) => favoriteMeal.id != meal.id).toList(),
        );
      } else {
        _data = _data.copyWith(
          favoritesMeals: [..._data.favoritesMeals, meal],
        );
      }
    });

    return !mealIsFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return FavoritesMealsScope(
      data: _data,
      child: widget.child,
    );
  }
}
