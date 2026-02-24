import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/providers/filter_meal_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final previous = ref.watch(filterMealProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter your Meal",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: previous[Filter.glutenfree]!,
            onChanged: (ischecked) {
              ref
                  .read(filterMealProvider.notifier)
                  .setFilters(Filter.glutenfree, ischecked);
            },
            title: Text(
              "Gluten Free",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              "Select for Gluten free Meal",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          SwitchListTile(
            value: previous[Filter.vegan]!,
            onChanged: (value) {
              ref
                  .read(filterMealProvider.notifier)
                  .setFilters(Filter.vegan, value);
            },
            title: Text(
              "Vegan",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              "Select for Vegan Meal",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          SwitchListTile(
            value: previous[Filter.vegeterian]!,
            onChanged: (value) {
              ref
                  .read(filterMealProvider.notifier)
                  .setFilters(Filter.vegeterian, value);
            },
            title: Text(
              "Vegeterian",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              "Select for Vegeterian Meal",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          SwitchListTile(
            value: previous[Filter.lactosefree]!,
            onChanged: (value) {
              ref
                  .read(filterMealProvider.notifier)
                  .setFilters(Filter.lactosefree, value);
            },
            title: Text(
              "Lactose Free",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              "Select for Lactose free Meal",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
