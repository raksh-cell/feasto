//import 'package:feasto/main.dart';
import 'package:feasto/models/meal.dart';
import 'package:feasto/provider/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:feasto/provider/fav_provider.dart';
class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final favoriteMeals=ref.watch(favorieMealsProvider);
    final isFavorite=favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [IconButton(
          onPressed: (){
            final wasAdded=ref.read(favorieMealsProvider.notifier).toggleMealFavStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  duration: const Duration(seconds: 2),
                  content: Row(
                    children: [
                      Icon(
                        wasAdded ? Icons.star : Icons.star_border,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          wasAdded
                              ? 'Meal added to favorites ⭐'
                              : 'Meal removed from favorites ❌',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },

            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition
                (
                  turns: Tween<double>(begin: 0.8,end: 1).animate(animation),
                child:child);
              },
              child: Icon(isFavorite ? Icons.star : Icons.star_border,
              key: ValueKey(isFavorite),),
          ),
        ),
        ],
      ),
      body: SingleChildScrollView(
        // Added SingleChildScrollView to prevent overflow
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the start
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              // Added padding for section titles
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final ingredient in meal.ingredients)
              Padding(
                // Added padding for better readability of list items
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 4.0), // Indent list items
                child: Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
            const SizedBox(
              height: 24,
            ), // Increased spacing
            Padding(
              // Added padding for section titles
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                // Moved "Steps" title outside the loop
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    // Changed to titleLarge for consistency
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final step in meal.steps) // Changed to iterate over meal.steps
              Padding(
                // Added padding for better readability of list items
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 4.0), // Indent list items
                child: Text(
                  step,
                  // textAlign: TextAlign.center, // Removed center align for steps, often better left-aligned
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
            const SizedBox(
              height: 24,
            ), // Added some padding at the bottom
          ],
        ),
      ),
    );
  }
}
