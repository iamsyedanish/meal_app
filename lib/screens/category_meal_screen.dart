import 'package:buddy_meal_app/constants/dummy_data.dart';
import 'package:buddy_meal_app/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen({super.key});
  static const categoryMeal = '/category_meal_screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final catTitle = routeArgs['title'];
    final catId = routeArgs['id'];
    final catMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(catId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: catMeals[index].id,
            title: catMeals[index].title,
            imageUrl: catMeals[index].imageUrl,
            affordability: catMeals[index].affordability,
            complexity: catMeals[index].complexity,
            duration: catMeals[index].duration,
          );
        },
        itemCount: catMeals.length,
      ),
    );
  }
}
