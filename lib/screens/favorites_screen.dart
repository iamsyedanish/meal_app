import 'package:buddy_meal_app/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
 
  const FavoritesScreen(
      {super.key, required this.favoriteMeals});

  

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text("No Favorites Yet!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
              duration: favoriteMeals[index].duration,
             );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
