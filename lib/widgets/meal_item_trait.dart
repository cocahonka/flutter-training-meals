import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    required this.label,
    required this.icon,
    super.key,
  });

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 17, color: Colors.white),
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
