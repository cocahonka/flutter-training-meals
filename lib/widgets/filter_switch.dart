import 'package:flutter/material.dart';

class FilterSwitch extends StatelessWidget {
  const FilterSwitch({
    required this.getValue,
    required this.onChanged,
    required this.title,
    required this.subtitle,
    super.key,
  });

  final bool Function(BuildContext context) getValue;
  final ValueSetter<bool> onChanged;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: getValue(context),
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
