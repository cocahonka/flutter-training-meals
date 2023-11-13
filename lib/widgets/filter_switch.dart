import 'package:flutter/material.dart';
import 'package:meals/models/filter.dart';
import 'package:meals/scopes/filters_scope.dart';

class FilterSwitch extends StatelessWidget {
  const FilterSwitch({
    required this.filter,
    required this.onChanged,
    required this.title,
    required this.subtitle,
    super.key,
  });

  final Filter filter;
  final ValueSetter<bool> onChanged;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: FiltersStateScope.watch(context, filter).getByFilter(filter),
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
