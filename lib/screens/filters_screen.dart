import 'package:flutter/material.dart';
import 'package:meals/models/filter.dart';
import 'package:meals/scopes/filters_scope.dart';
import 'package:meals/widgets/filter_switch.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop();
          return false;
        },
        child: Column(
          children: [
            FilterSwitch(
              filter: Filter.gluttenFree,
              onChanged: FiltersStateProvider.of(context).changeGluten,
              title: 'Gluten-free',
              subtitle: 'Only included gluten-free meals.',
            ),
            FilterSwitch(
              filter: Filter.lactoseFree,
              onChanged: FiltersStateProvider.of(context).changeLactose,
              title: 'Lactose-free',
              subtitle: 'Only included lactose-free meals.',
            ),
            FilterSwitch(
              filter: Filter.vegeterian,
              onChanged: FiltersStateProvider.of(context).changeVegeterian,
              title: 'Vegeterian',
              subtitle: 'Only included vegeterian meals.',
            ),
            FilterSwitch(
              filter: Filter.vegan,
              onChanged: FiltersStateProvider.of(context).changeVegan,
              title: 'Vegan',
              subtitle: 'Only included vegan meals.',
            ),
          ],
        ),
      ),
    );
  }
}
