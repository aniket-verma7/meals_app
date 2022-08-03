import 'package:flutter/material.dart';
import 'package:meals_app/constants/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categordId;
  // final String categoryTitle;
  //
  //
  // CategoryMealsScreen(this.categordId, this.categoryTitle);

  static const String routeName = '/categories-meals';
  final List<Meal> availableMeal;

  CategoryMealsScreen(this.availableMeal);

  @override
  Widget build(BuildContext context) {
    /**
     * Similar to getting intent data in Android
     */
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String id = routeArgs['id'];
    final String appBarTitle = routeArgs['title'];

    final categoryMeals = availableMeal
        .where((element) => element.categories.contains(id))
        .toList();

    print(categoryMeals.length);

    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
