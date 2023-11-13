import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/scopes/favorites_meals_scope.dart';
import 'package:meals/scopes/filters_scope.dart';
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

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _showMealsScreenFromDrawer() => Navigator.of(context).pop();

  void _showFiltersScreenFromDrawer() {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return const FiltersScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filters = FiltersStateScope.watch(context);

    final availableMeals = Constants.dummyMeals.where((meal) {
      if (filters.gluttenFree && !meal.isGlutenFree) return false;
      if (filters.lactoseFree && !meal.isLactoseFree) return false;
      if (filters.vegeterian && !meal.isVegetarian) return false;
      if (filters.vegan && !meal.isVegan) return false;

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
