import 'package:buddy_meal_app/screens/filters_screen.dart';
import 'package:buddy_meal_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buttonDesign(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      Container(
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        color: Theme.of(context).colorScheme.secondary,
        child: Text(
          'Buddy Meal!',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).colorScheme.primary),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      buttonDesign(('Meals'), Icons.restaurant, () {
        Navigator.pushReplacementNamed(context, '/');
      }),
      buttonDesign(('Filter'), Icons.settings, () {
        Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
      }),
    ]));
  }
}
