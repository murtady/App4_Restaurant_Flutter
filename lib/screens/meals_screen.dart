import 'package:app4/models/meal.dart';
import 'package:app4/screens/meal_detail_screen.dart';
import 'package:app4/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
   this.title,
      required this.meals, 
      required this.onTaggleFavorite});
  final String? title;
  final List<Meal> meals;

  final void Function(Meal meal) onTaggleFavorite;
  @override
  Widget build(BuildContext context) {
    return title==null?content(context): Scaffold(
      appBar: AppBar(title: Text(title!)),
      body:content(context),
    );
  }      content(BuildContext context) {
          return  SingleChildScrollView(
        child: Column(
          children:  meals .map(
                    (meal) => MealItem(
                      meal: meal,
            
                      onSelectMeal: (Meal meal) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (ctx) => MealDetailScreen(
                                  meal: meal,
                                  onTaggleFavorite:   onTaggleFavorite,
                                ),
                          ),
                        );
                      },
                      complexity: meal.complexity,
                      affordability: meal.affordability,
                    ),
                  )
                  .toList(),
        ),
      )   ;}
} 
