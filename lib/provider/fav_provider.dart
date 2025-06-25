import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:feasto/models/meal.dart';


class FavMealsNotifier extends StateNotifier<List<Meal>>{
  FavMealsNotifier():super([]);


  bool toggleMealFavStatus(Meal meal){

final mealIsFav=state.contains(meal);
if(mealIsFav){
  state=state.where((m)=>m.id!=meal.id).toList();
  return false;
}else{
  state=[...state,meal];
  return true;
}
}
  }

final favorieMealsProvider=
StateNotifierProvider<FavMealsNotifier,List<Meal>>((ref){
  return FavMealsNotifier();
});