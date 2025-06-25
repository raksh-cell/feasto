// tabs.dart
//import 'package:feasto/data/dummy_data.dart';
import 'package:feasto/screens/categories.dart';
import 'package:feasto/screens/filters.dart';
import 'package:feasto/screens/meals.dart';
import 'package:feasto/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:feasto/provider/meals_provider.dart';
import 'package:feasto/provider/fav_provider.dart';
import 'package:feasto/provider/filter_provider.dart';
const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState(){
    return _TabsScreenState();
}
}
class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  //Map<Filter, bool> _selectedFilters = kInitialFilter;




// before using provider/riverpod
  // void _toggleMealFavStatus(Meal meal) {
  //   final isExisting = _favoriteMeals.contains(meal);

  //   setState(() {
  //     if (isExisting) {
  //       _favoriteMeals.remove(meal);
  //       _showInfoMsg('Removed from favorites ✖️', isFav: false);
  //     } else {
  //       _favoriteMeals.add(meal);
  //       _showInfoMsg('Added to favorites ⭐', isFav: true);
  //     }
  //   });
  // }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) =>const  FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    final availableMeals =ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals=ref.watch(favorieMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,

      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
