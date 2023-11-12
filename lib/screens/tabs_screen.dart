import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/filter.dart';
import 'package:meals/scopes/favorites_meals_scope.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedPageIndex = 0;
  FiltersStatus _filtersStatus = (
    gluttenFree: false,
    lactoseFree: false,
    vegeterian: false,
    vegan: false,
  );

  // void _toggleMealFavoriteStatus(Meal meal) {
  //   final isExisting = _favoriteMeals.contains(meal);
  //   setState(() {
  //     if (isExisting) {
  //       _favoriteMeals.remove(meal);
  //       _showInfoMessage('Meal is no longer a favorite.');
  //     } else {
  //       _favoriteMeals.add(meal);
  //       _showInfoMessage('Marked as a favorite!');
  //     }
  //   });
  // }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _showMealsScreenFromDrawer() => Navigator.of(context).pop();

  Future<void> _showFiltersScreenFromDrawer() async {
    Navigator.of(context).pop();
    final result = await Navigator.of(context).push(
      MaterialPageRoute<FiltersStatus>(
        builder: (context) {
          return FiltersScreen(_filtersStatus);
        },
      ),
    );

    setState(() {
      _filtersStatus = result ?? _filtersStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = Constants.dummyMeals.where((meal) {
      if (_filtersStatus.gluttenFree && !meal.isGlutenFree) return false;
      if (_filtersStatus.lactoseFree && !meal.isLactoseFree) return false;
      if (_filtersStatus.vegeterian && !meal.isVegetarian) return false;
      if (_filtersStatus.vegan && !meal.isVegan) return false;

      return true;
    }).toList();

    final String activePageTitle;
    final Widget activePage;

    switch (_selectedPageIndex) {
      case 1:
        activePageTitle = 'Your favorites';
        final favoritesMeals = FavoritesMealsScope.watch(context).favoritesMeals;
        activePage = MealsScreen(
          meals: favoritesMeals,
        );
      default:
        activePageTitle = 'Categories';
        activePage = CategoriesScreen(
          availableMeals: availableMeals,
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onMealsScreenSelected: _showMealsScreenFromDrawer,
        onFiltersScreenSelected: _showFiltersScreenFromDrawer,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
