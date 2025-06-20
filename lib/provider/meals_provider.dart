import 'package:app4/data/dummy_data.dart';
import 'package:app4/screens/meal_detail_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvider=Provider((ref){
  return dummyMeals;
});