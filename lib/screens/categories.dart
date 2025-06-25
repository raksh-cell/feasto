import 'package:feasto/data/dummy_data.dart';
import 'package:feasto/models/category.dart';
import 'package:feasto/models/meal.dart';
import 'package:feasto/screens/meals.dart';
//import 'package:feasto/models/category.dart';
import 'package:flutter/material.dart';
import 'package:feasto/widgets/categories_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,

    required this.availableMeals,
  });

  final List<Meal>availableMeals;

  void _selectCategory(BuildContext context,Category category ){
    final filteredMeals=availableMeals
    .where((meal)=>
    meal.categories
    .contains(category.id)).
    toList();
   
        //same=>navigator.push(context,route);
      Navigator.of(context).push(
        MaterialPageRoute(
      builder: (ctx)=>MealsScreen(
        title:category.title,
        meals:filteredMeals,
      ),
      ),
      );      
  }

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: const EdgeInsets.all(24), // Optional: for spacing around the grid
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20, // Optional: add vertical space too
        ),
        children: [
          for (final category in availableCategories)
            CategoriesGridItem(
              category: category,
              onSelectcategory: (){
                _selectCategory(context,category);

            },
            ),
        ],
      );

  }
}
