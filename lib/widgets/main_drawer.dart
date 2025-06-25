import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onSelectScreen,
  });

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      child: Container(
        color: colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.fastfood_rounded,
                    size: 48,
                    color: colorScheme.onPrimary,
                  ),
                  const SizedBox(width: 18),
                  Text(
                    'Feasto',
                    style: textTheme.titleLarge!.copyWith(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              thickness: 0.4,
              indent: 20,
              endIndent: 20,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(
                Icons.restaurant_menu_rounded,
                size: 26,
                color: colorScheme.onSurface,
              ),
              title: Text(
                'Meals',
                style: textTheme.titleMedium!.copyWith(
                  color: colorScheme.onSurface,
                  fontSize: 20,
                ),
              ),
              onTap: () => onSelectScreen('meals'),
            ),
            ListTile(
              leading: Icon(
                Icons.filter_alt_rounded,
                size: 26,
                color: colorScheme.onSurface,
              ),
              title: Text(
                'Filters',
                style: textTheme.titleMedium!.copyWith(
                  color: colorScheme.onSurface,
                  fontSize: 20,
                ),
              ),
              onTap: () => onSelectScreen('filters'),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Made with ❤️ by Zoro',
                textAlign: TextAlign.center,
                style: textTheme.labelSmall!.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.5),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
