import 'dart:ui';

import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  static const routeName = "/meal-detail";

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      height: 150,
      width: 300,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
        ),
        color: Colors.white,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == mealId,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 6,
                      ),
                      child: Text(
                        selectedMeal.ingredients[index],
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Text("${index + 1}"),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
