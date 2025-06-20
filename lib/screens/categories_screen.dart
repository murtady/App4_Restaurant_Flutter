import 'package:app4/models/meal.dart';
import 'package:app4/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
// ignore: duplicate_import
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
 const CategoriesScreen({super.key,
 // required this.onTaggleFavorite,
 required this.availableMeals
 });
 // final void Function(Meal meal) onTaggleFavorite;
   final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      children: [
        for (final category in avalableCategories)
          CategoryGridItem(
            category: category,
         meals: [],
           // onTaggleFavorite: onTaggleFavorite, 
            availableMeals:availableMeals
          ),
      ],
    );
  }
}
