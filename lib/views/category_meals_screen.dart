import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String catId;
  final String catTitle;

  const CategoryMealsScreen(
      {super.key, required this.catId, required this.catTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: const Center(
        child: Text("Hello World"),
      ),
    );
  }
}
