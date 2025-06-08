import 'package:app4/models/meal.dart';
import 'package:app4/screens/categories_screen.dart';
import 'package:app4/screens/meals_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeal = [];
  //التبديل مثثثل المفتاح
  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeal.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeal.remove(meal);
      });
    } else{
      setState(() {
        _favoriteMeal.add(meal);
      });
    }
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activepage = CategoriesScreen(
      onTaggleFavorite: _toggleMealFavoriteStatus,);
    var actionsPageTitle = 'Pick your Categories';
    if (_selectedPageIndex == 1) {
      activepage = MealsScreen
      (
        meals:_favoriteMeal,
      onTaggleFavorite: _toggleMealFavoriteStatus);
      actionsPageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(actionsPageTitle)),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Cateories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.start),
           label: 'Favorites'),
        ],
      ),
    );
  }
}
