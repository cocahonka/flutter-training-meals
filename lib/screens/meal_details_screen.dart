import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(this.meal, {super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: meal.imageUrl,
        fit: BoxFit.cover,
        height: 300,
        width: double.infinity,
      ),
    );
  }
}
