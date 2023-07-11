import 'package:buddy_meal_app/constants/dummy_data.dart';
import 'package:buddy_meal_app/models/meal.dart';
import 'package:buddy_meal_app/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatefulWidget {
  const CategoryMealScreen({super.key});
  static const categoryMeal = '/category_meal_screen';

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String catTitle;
  late String catId;
  late List<Meal> catMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      catTitle = routeArgs['title']!;
      catId = routeArgs['id']!;
      catMeals = DUMMY_MEALS
          .where((element) => element.categories.contains(catId))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      catMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
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
            removeItem: _removeMeal,
          );
        },
        itemCount: catMeals.length,
      ),
    );
  }
}
