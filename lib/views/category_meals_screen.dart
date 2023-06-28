import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final catId = routeArgs['id'];
    final catTitle = routeArgs['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle!),
      ),
      body: const Center(
        child: Text("Hello World"),
      ),
    );
  }
}
