import 'package:buddy_meal_app/screens/categories_screen.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({super.key, required this.favoriteMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {'page': const CategoriesScreen(), 'title': "Categories"},
      {
        "page": FavoritesScreen(favoriteMeals: widget.favoriteMeals),
        "title": "Favorites"
      },
    ];
    super.initState();
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(_pages[_selectedPageIndex]['title'].toString())),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
        onTap: _selectScreen,
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
    );
  }
}

// DefaultTabController(
//         length: 2,
//         initialIndex: 0,
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text("Meals"),
//             bottom: const TabBar(
//               tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(Icons.favorite),
//                 text: "Favorites",
//               ),
//             ]),
//           ),
//           body: const TabBarView(children: [
//             CategoriesScreen(),
//             FavoritesScreen(),
//           ]),
//         ));
