import 'package:buddy_meal_app/constants/dummy_data.dart';
import 'package:buddy_meal_app/models/meal.dart';
import 'package:buddy_meal_app/screens/categories_screen.dart';
import 'package:buddy_meal_app/screens/category_meal_screen.dart';
import 'package:buddy_meal_app/screens/filters_screen.dart';
import 'package:buddy_meal_app/screens/meal_detail_screen.dart';
import 'package:buddy_meal_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  var _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) =>
      _favoriteMeals.any((element) => element.id == id);

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }

        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }

        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }

        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  //  void _removeMeal(String mealId, List<Meal> catMeals) {
  //   setState(() {
  //     catMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buddy Meal',
      theme: ThemeData(
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium:
                  const TextStyle(color: Color.fromARGB(255, 22, 22, 22)),
              titleLarge: const TextStyle(
                  fontSize: 18, fontFamily: 'RobotoCondensed'))),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(favoriteMeals: _favoriteMeals),
        CategoryMealScreen.categoryMeal: (context) =>
            CategoryMealScreen(availableMeals: _availableMeals),
        MealDetailScreen.mealDetail: (context) => MealDetailScreen(
            toggleFavorite: _toggleFavorite, isFavorite: _isMealFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(
              saveFilters: _setFilters,
              currentFilters: _filters,
            ),
      },

      // onGenerateRoute: ,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
