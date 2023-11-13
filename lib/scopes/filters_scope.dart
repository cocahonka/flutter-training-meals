// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:meals/models/filter.dart';

class FiltersState {
  const FiltersState({
    required this.gluttenFree,
    required this.lactoseFree,
    required this.vegeterian,
    required this.vegan,
  });

  final bool gluttenFree;
  final bool lactoseFree;
  final bool vegeterian;
  final bool vegan;

  FiltersState copyWith({
    bool? gluttenFree,
    bool? lactoseFree,
    bool? vegeterian,
    bool? vegan,
  }) {
    return FiltersState(
      gluttenFree: gluttenFree ?? this.gluttenFree,
      lactoseFree: lactoseFree ?? this.lactoseFree,
      vegeterian: vegeterian ?? this.vegeterian,
      vegan: vegan ?? this.vegan,
    );
  }
}

class FiltersStateScope extends InheritedModel<Filter> {
  const FiltersStateScope({
    required this.data,
    required super.child,
    super.key,
  });

  final FiltersState data;

  static FiltersState watch(BuildContext context, [Filter? aspect]) =>
      InheritedModel.inheritFrom<FiltersStateScope>(context, aspect: aspect)!.data;

  @override
  bool updateShouldNotify(covariant FiltersStateScope oldWidget) {
    return data.gluttenFree != oldWidget.data.gluttenFree ||
        data.lactoseFree != oldWidget.data.lactoseFree ||
        data.vegeterian != oldWidget.data.vegeterian ||
        data.vegan != oldWidget.data.vegan;
  }

  @override
  bool updateShouldNotifyDependent(
    covariant FiltersStateScope oldWidget,
    Set<Filter> dependencies,
  ) {
    return (data.gluttenFree != oldWidget.data.gluttenFree && dependencies.contains(Filter.gluttenFree)) ||
        (data.lactoseFree != oldWidget.data.lactoseFree && dependencies.contains(Filter.lactoseFree)) ||
        (data.vegeterian != oldWidget.data.vegeterian && dependencies.contains(Filter.vegeterian)) ||
        (data.vegan != oldWidget.data.vegan && dependencies.contains(Filter.vegan));
  }
}

class FiltersStateProvider extends StatefulWidget {
  const FiltersStateProvider({required this.child, super.key});

  final Widget child;

  // ignore: library_private_types_in_public_api
  static _FiltersStateProviderState of(BuildContext context) =>
      context.findAncestorStateOfType<_FiltersStateProviderState>()!;

  @override
  State<FiltersStateProvider> createState() => _FiltersStateProviderState();
}

class _FiltersStateProviderState extends State<FiltersStateProvider> {
  var _data = const FiltersState(
    gluttenFree: false,
    lactoseFree: false,
    vegeterian: false,
    vegan: false,
  );

  void changeGluten(bool value) {
    setState(() {
      _data = _data.copyWith(gluttenFree: value);
    });
  }

  void changeLactose(bool value) {
    setState(() {
      _data = _data.copyWith(lactoseFree: value);
    });
  }

  void changeVegeterian(bool value) {
    setState(() {
      _data = _data.copyWith(vegeterian: value);
    });
  }

  void changeVegan(bool value) {
    setState(() {
      _data = _data.copyWith(vegan: value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FiltersStateScope(
      data: _data,
      child: widget.child,
    );
  }
}
