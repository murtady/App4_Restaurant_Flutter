// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:app4/data/dummy_data.dart';
import 'package:app4/models/category.dart';
import 'package:app4/models/meal.dart';
import 'package:app4/screens/meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.meals,
    required this.onTaggleFavorite,
  });
  //استقبال
  final Category category;
  final List<Meal> meals;
  final void Function(Meal meal) onTaggleFavorite;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // ignore: unused_local_variable
      onTap: () {
        // ignore: unused_local_variable
        final filteredMeal =
            //البحث عن التطابق
            dummyMeals
                .where((meal) => meal.categories.contains(category.id))
                .toList();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (ctx) => MealsScreen(
                  meals: filteredMeal,
                  onTaggleFavorite: onTaggleFavorite,
                ),
          ),
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.54),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            // ignore: deprecated_member_use
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
// import 'package:app4/models/meal.dart';
// import 'package:flutter/material.dart';
// import '../models/category.dart';
// import '../data/dummy_data.dart';
// import '../screens/meals_screen.dart';

// class CategoryGridItem extends StatelessWidget {
//   final Category category;
//   const CategoryGridItem({Key? key, required this.category}) : super(key: key);

//   void selectCategory(BuildContext context) {
//     // Filter meals by the selected category ID
//     final filteredMeals = dummyMeals.where((meal) {
//       return meal.categories.contains(category.id);
//     }).toList();

//     // Navigate to the MealsScreen with the filtered list
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => MealsScreen(
//           title: category.title,
//           meals: filteredMeals,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         final filteredMeal=dummyMeals.where((meal)=>
//         meal.categories.contains(category.id)).toList;}
//          ,
//       splashColor: Theme.of(context).primaryColor,
//       borderRadius: BorderRadius.circular(15),
//       child: Container(
//         padding: const EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               category.color.withOpacity(0.7),
//               category.color,
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Text(
//           category.title,
//           style: Theme.of(context).textTheme.titleLarge,
//         ),
//       ),
//     );
//   }
// }
