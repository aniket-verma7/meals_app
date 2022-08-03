import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {

  List<Meal> _favoriteMeals;

  FavoritesScreen(this._favoriteMeals);


  Widget buildFavoriteScreen(BuildContext context) {
    return (_favoriteMeals.length > 0) ? ListView.builder(
      itemBuilder: (context, index) {
        return MealItem(_favoriteMeals[index]);
      },
      itemCount: _favoriteMeals.length,
    ) : Center(
      child: Text('No Favorite Meals Yet'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildFavoriteScreen(context);
  }
}
