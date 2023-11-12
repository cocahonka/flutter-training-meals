import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    required this.meals,
    this.title,
    super.key,
  });

  final String? title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return MealDetailsScreen(
            meal,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeWidget = switch (meals.isEmpty) {
      true => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Uh oh ... nothing here!',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Try selecting a different category!',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
            ],
          ),
        ),
      false => ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return MealItem(
              meal: meals[index],
              onSelectMeal: (meal) => _selectMeal(context, meal),
            );
          },
        ),
    };

    if (title == null) {
      return activeWidget;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: activeWidget,
    );
  }
}
