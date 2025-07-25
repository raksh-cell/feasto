import 'package:feasto/screens/meal_details.dart';
import 'package:feasto/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:feasto/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;


  void selectMeal(BuildContext context,Meal  meal){
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx)=>
      MealDetailsScreen(meal: meal,
      ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'oh ohhoo nothing here',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) =>
         MealItem(meal: meals[index],
         onSelectMeal: (context,meal){
          selectMeal(context, meal);
         },
         ),
      );
    }

if(title==null){
  return content;
}


    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
