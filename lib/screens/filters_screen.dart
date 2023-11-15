import 'package:flutter/material.dart';
import 'package:meals/models/filter.dart';
import 'package:meals/scopes/filters_scope.dart';
import 'package:meals/widgets/filter_switch.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterSwitch(
            getValue: (context) => FiltersStateScope.watch(context, Filter.gluttenFree).gluttenFree,
            onChanged: FiltersStateProvider.of(context).changeGluten,
            title: 'Gluten-free',
            subtitle: 'Only included gluten-free meals.',
          ),
          FilterSwitch(
            getValue: (context) => FiltersStateScope.watch(context, Filter.lactoseFree).lactoseFree,
            onChanged: FiltersStateProvider.of(context).changeLactose,
            title: 'Lactose-free',
            subtitle: 'Only included lactose-free meals.',
          ),
          FilterSwitch(
            getValue: (context) => FiltersStateScope.watch(context, Filter.vegeterian).vegeterian,
            onChanged: FiltersStateProvider.of(context).changeVegeterian,
            title: 'Vegeterian',
            subtitle: 'Only included vegeterian meals.',
          ),
          FilterSwitch(
            getValue: (context) => FiltersStateScope.watch(context, Filter.vegan).vegan,
            onChanged: FiltersStateProvider.of(context).changeVegan,
            title: 'Vegan',
            subtitle: 'Only included vegan meals.',
          ),
        ],
      ),
    );
  }
}
