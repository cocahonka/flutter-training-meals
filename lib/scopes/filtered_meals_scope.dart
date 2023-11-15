import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/scopes/filters_scope.dart';

class FilteredMealsStateScope extends InheritedWidget {
  const FilteredMealsStateScope({
    required this.data,
    required super.child,
    super.key,
  });

  final List<Meal> data;

  static List<Meal> watch(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<FilteredMealsStateScope>()!.data;

  @override
  bool updateShouldNotify(FilteredMealsStateScope oldWidget) {
    return data != oldWidget.data;
  }
}

class FilteredMealsWidget extends StatefulWidget {
  const FilteredMealsWidget({required this.child, super.key});

  final Widget child;

  @override
  State<FilteredMealsWidget> createState() => _FilteredMealsWidgetState();
}

class _FilteredMealsWidgetState extends State<FilteredMealsWidget> {
  late FiltersState _filters;
  late List<Meal> _meals;

  void _getAvailableMeals() {
    _meals = Constants.dummyMeals.where((meal) {
      if (_filters.gluttenFree && !meal.isGlutenFree) return false;
      if (_filters.lactoseFree && !meal.isLactoseFree) return false;
      if (_filters.vegeterian && !meal.isVegetarian) return false;
      if (_filters.vegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  @override
  void didChangeDependencies() {
    _filters = FiltersStateScope.watch(context);
    _getAvailableMeals();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FilteredMealsStateScope(
      data: _meals,
      child: widget.child,
    );
  }
}
