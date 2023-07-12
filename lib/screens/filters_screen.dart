import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(subtitle),
        onChanged: (newValue) => updateValue(newValue));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Filters")),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                "Select you meal of choice",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Expanded(
              child: ListView(children: [
            _buildSwitchListTile(
                "Gluten-free",
                "This choice will show only gluten-free meals",
                _glutenFree, (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            }),
            _buildSwitchListTile(
                "Lactos-free",
                "This choice will show only Lactose-free meals",
                _lactoseFree, (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            }),
            _buildSwitchListTile(
                "Vegetarian",
                "This choice will show only vegetarian meals",
                _vegetarian, (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            }),
            _buildSwitchListTile(
                "Vegan", "This choice will show only vegan meals", _vegan,
                (newValue) {
              setState(() {
                _vegan = newValue;
              });
            })
          ])),
        ],
      ),
    );
  }
}
