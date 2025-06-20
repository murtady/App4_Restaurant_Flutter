import 'package:app4/models/meal.dart';
import 'package:app4/provider/favortes_provider.dart';
import 'package:app4/provider/filters_provider.dart';
import 'package:app4/provider/meals_provider.dart';
import 'package:app4/screens/categories_screen.dart';
import 'package:app4/screens/filters_screen.dart';
import 'package:app4/screens/meals_screen.dart';
import 'package:app4/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// const kInitialFilter = {
//   Filter.glutenFree: false,
//   Filter.lactoseFree: false,
//   Filter.vegan: false,
//   Filter.Vegetarian: false,
// };

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  // ignore: override_on_non_overriding_member
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  //final List<Meal> _favoriteMeal = [];
  //Map<Filter, bool> _selectedFilters = kInitialFilter;

  // void _showInfoMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(
  //     context,
  //   ).showSnackBar(SnackBar(content: Text(message)));
  // }

  void _setScreen(String identifier) {
    if (identifier == "filters") {
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            //currentFilters: _selectedFilters
            ),
        ),
  //     ).then(
  //       (value) => setState(() => _selectedFilters = value ?? kInitialFilter),
      );
  //   } else {
  //     Navigator.of(context).pop();
   }
  

  //التبديل مثثثل المفتاح
  // void _toggleMealFavoriteStatus(Meal meal) {
  //   final isExisting = _favoriteMeal.contains(meal);
  //   if (isExisting) {
  //     setState(() {
  //       _favoriteMeal.remove(meal);
  //     });
  //     _showInfoMessage("Meal is no longer a favorite.");
  //   } else {
  //     setState(() {
  //       _favoriteMeal.add(meal);
  //       _showInfoMessage("Meal is  longer a favorite.");
  //     });
  //   }
  // }

    }
  void _selectedPage(int index) {
    // setState(() {
    //   _selectedPageIndex = index;
    // });
   // _showInfoMessage("Marked as a favorite!");
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
 final activeFilters=ref.watch(filtersProvider);
    
   
  
    final List<Meal> availableMeals =
        meals.where((meal) {
          if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
            return false;
          }
          if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
            return false;
          }
          if (activeFilters[Filter.vegan]! && !meal.isVegan) {
            return false;
          }
          if (activeFilters[Filter.Vegetarian]! && !meal.isVegetarian) {
            return false;
          }
          return true;
        }).toList();
    Widget activepage = CategoriesScreen(
      //onTaggleFavorite: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );
    var actionsPageTitle = 'Pick your Categories';
    if (_selectedPageIndex == 1) {
      final List<Meal> favoriteMeal=
      ref.watch(favoritesMealsProvider);
      activepage = MealsScreen(
        meals: favoriteMeal,
       // onTaggleFavorite: _toggleMealFavoriteStatus,
      );
      actionsPageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(actionsPageTitle)),

      body: activepage,
      drawer: MainDrawer(onSelectScreen: _setScreen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Cateories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.start), label: 'Favorites'),
        ],
      ),
    );
  }
}
