import 'package:flutter/material.dart';
import 'package:meals/widgets/filter_switch.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  void _glutenFreeFilterChange(bool value) {
    setState(() {
      _glutenFreeFilterSet = value;
    });
  }

  var _lactoseFreeFilterSet = false;
  void _lactoseFreeFilterChange(bool value) {
    setState(() {
      _lactoseFreeFilterSet = value;
    });
  }

  var _vegetarianFreeFilterSet = false;
  void _vegetarianFreeFilterChange(bool value) {
    setState(() {
      _vegetarianFreeFilterSet = value;
    });
  }

  var _veganFilterSet = false;
  void _veganFilterChange(bool value) {
    setState(() {
      _veganFilterSet = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterSwitch(
            value: _glutenFreeFilterSet,
            onChanged: _glutenFreeFilterChange,
            title: 'Gluten-free',
            subtitle: 'Only included gluten-free meals.',
          ),
          FilterSwitch(
            value: _lactoseFreeFilterSet,
            onChanged: _lactoseFreeFilterChange,
            title: 'Lactose-free',
            subtitle: 'Only included lactose-free meals.',
          ),
          FilterSwitch(
            value: _vegetarianFreeFilterSet,
            onChanged: _vegetarianFreeFilterChange,
            title: 'Vegeterian',
            subtitle: 'Only included vegeterian meals.',
          ),
          FilterSwitch(
            value: _veganFilterSet,
            onChanged: _veganFilterChange,
            title: 'Vegan',
            subtitle: 'Only included vegan meals.',
          ),
        ],
      ),
    );
  }
}
