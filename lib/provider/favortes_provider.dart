
import 'package:app4/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier():super([]);



 bool toggleMealFavoriteStatus(Meal meal) {
    final isExisting = state.contains(meal);
    if (isExisting) {
    
     // نفس // state.remove(meal);
        state=state.where((element)=>element.id != meal.id).toList();
   return false;
      //_showInfoMessage("Meal is no longer a favorite.");
    } else {
     // [...[1,2,3],4];
     state=[...state
      ,meal];
return true;
        //state.add(meal);
        // _showInfoMessage("Meal is  longer a favorite.");
 
    }
  }

 
}
// ignore: prefer_function_declarations_over_variables
final favoritesMealsProvider=StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref){
  return FavoriteMealsNotifier() ;
});