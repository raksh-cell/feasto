import 'package:flutter/material.dart';
import 'package:feasto/models/category.dart';

class CategoriesGridItem extends StatelessWidget {
  const CategoriesGridItem({
    super.key,
    required this.category,
    required this.onSelectcategory,
  });

  final Category category;
  final void Function() onSelectcategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectcategory,
      splashColor:Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withAlpha((0.55 * 255).toInt()),
              category.color.withAlpha((0.9 * 255).toInt()),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16), // Optional: rounded look
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),

        ),
      ),
    );
  }
}
