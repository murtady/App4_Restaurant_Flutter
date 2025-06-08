// import 'package:flutter/material.dart';

// import '../models/category.dart';

/// Meal model with various attributes
class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  Meal({
    required this.title,
    required this.id,
    required this.categories,

    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required bool isVeterarian,
  });
}

enum Complexity { simple, challenging, hard }

enum Affordability { affordable, pricey, luxurious }

// /// Sample categories list
// List<Category> avalableCategories = [
//    Category(id: 'c1', title: 'Main Dishes', color: Colors.purple),
//    Category(id: 'c2', title: 'Appetizers', color: Colors.red),
//    Category(id: 'c3', title: 'Desserts', color: Colors.orange),
//    Category(id: 'c4', title: 'Drinks', color: Colors.blue),
//    Category(id: 'c5', title: 'Salads', color: Colors.green),
//    Category(id: 'c6', title: 'Breakfast', color: Colors.brown),
//    Category(id: 'c7', title: 'Sandwiches', color: Colors.teal),
//    Category(id: 'c8', title: 'Fast Food', color: Colors.amber),
//    Category(id: 'c9', title: 'Vegetarian Dishes', color: Colors.lightGreen),
//    Category(id: 'c10', title: 'International Cuisine', color: Colors.indigo),
//    Category(id: 'c11', title: 'Internat', color: Colors.purpleAccent),
// ];
