import 'package:buddy_meal_app/views/categories_screen.dart';
import 'package:buddy_meal_app/views/category_meal_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/': (context) => const CategoriesScreen(),
        CategoryMealScreen.categoryMeal: (context) => const CategoryMealScreen()
      },
    );
  }
}
