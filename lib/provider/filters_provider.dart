
import 'package:app4/models/meal.dart';
import 'package:app4/provider/favortes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
enum Filter{
  glutenFree,
  lactoseFree,
  vegan,
  // ignore: constant_identifier_names
  Vegetarian,
}

class FiltersNotifier extends StateNotifier<Map<Filter,bool>>{
FiltersNotifier():super({
   Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.Vegetarian: false,
})


;
void setFilters(Map< Filter,bool  >chodenFilters) {

    
state= chodenFilters;
 
    }
  
 void setFilter(Filter filter,bool  isActive) {

    
state={...state,filter:isActive};
 
    }
  }

 

// ignore: prefer_function_declarations_over_variables
final filtersProvider=StateNotifierProvider<FiltersNotifier,Map<Filter,bool>>((ref){
  return FiltersNotifier() ;
});