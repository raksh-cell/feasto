// import 'package:feasto/screens/tabs.dart';
// import 'package:feasto/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:feasto/provider/filter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilters= ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if(identifier=='meals'){
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //       builder: (ctx)=> const TabsScreen()
      //       ),
      //       );

      //   }

      // },
      // ),


      body: Column(
          children: [
        
            //################################################################################
            SwitchListTile(
              value: activeFilters[Filter.glutenFree]!, 
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).
                setFilter(Filter.glutenFree, isChecked);
              },
              title: Text('Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color :Theme.of(context).colorScheme.onSurface,
                ),
                ),
                subtitle: Text('only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color :Theme.of(context).colorScheme.onSurface,
                ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left:34,right: 22),
        
              ),
        //##############################################################################################################
              SwitchListTile(
              value: activeFilters[Filter.lactoseFree]!, 
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).
                setFilter(Filter.lactoseFree, isChecked);
              },
              title: Text('lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color :Theme.of(context).colorScheme.onSurface,
                ),
                ),
                subtitle: Text('only include Lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color :Theme.of(context).colorScheme.onSurface,
                ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left:34,right: 22),
        
              ),
            //###########################################################################
            SwitchListTile(
              value: activeFilters[Filter.vegan]!, 
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).
                setFilter(Filter.vegan, isChecked);
              },
              title: Text('Vegan Meal',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color :Theme.of(context).colorScheme.onSurface,
                ),
                ),
                subtitle: Text('only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color :Theme.of(context).colorScheme.onSurface,
                ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left:34,right: 22),
        
              ),
        //##############################################################################################################
              SwitchListTile(
              value: activeFilters[Filter.vegetarian]!, 
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).
                setFilter(Filter.vegetarian, isChecked);
              },
              title: Text('Vegetarian Meal',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color :Theme.of(context).colorScheme.onSurface,
                ),
                ),
                subtitle: Text('only include Vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color :Theme.of(context).colorScheme.onSurface,
                ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left:34,right: 22),
        
              ),
            //###########################################################################
          ],
        ),
      );

  }
}