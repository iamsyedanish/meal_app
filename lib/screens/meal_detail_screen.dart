import 'package:buddy_meal_app/constants/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavorite;
  final Function isFavorite;
  const MealDetailScreen(
      {super.key, required this.toggleFavorite, required this.isFavorite});

  static const mealDetail = '/meal_detials';

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget buildSectionTitle(BuildContext context, String title) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }

    void showToast() {
      Toast.show(
        isFavorite(mealId) ? "Added to favorites" : "Removed from favorites",
        backgroundColor: Theme.of(context).colorScheme.secondary,
        textStyle: const TextStyle(
          color: Colors.white,
        ),
        gravity: Toast.bottom,
        duration: Toast.lengthShort,
      );
    }

    Widget buildContainer(Widget child) {
      ToastContext().init(context);
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 200,
        width: MediaQuery.of(context).size.width * 0.8,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        actions: [
          IconButton(
              onPressed: () {
                toggleFavorite(mealId);
                showToast();
              },
              icon: isFavorite(mealId)
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text(selectedMeal.ingredients[index])),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: Text("# ${(index + 1)}"),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    const Divider(
                      color: Colors.black54,
                    ),
                  ],
                );
              },
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     child: const Icon(Icons.delete),
      //     onPressed: () => Navigator.pop(context, mealId)),
    );
  }
}
