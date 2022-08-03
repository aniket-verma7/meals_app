import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meals_app/constants/dummy_data.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/settings_screen.dart';
import 'package:meals_app/screens/tab_screen.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _filters = {
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'veg':false,
  };


  List<Meal> favoriteMeals = [];


  void _toggleFavorite(Meal meal){
    setState(() {
      if(!favoriteMeals.remove(meal)){
        favoriteMeals.add(meal);
      }
    });
  }

  bool _isFavorite(Meal meal){
    return favoriteMeals.any((element) => element.id == meal.id);
  }

  List<Meal> get availableMeals{
    return DUMMY_MEALS.where((meal){
      if(_filters['gluten'] && !meal.isGlutenFree)return false;
      if(_filters['lactose'] && !meal.isLactoseFree)return false;
      if(_filters['vegan'] && !meal.isVegan)return false;
      if(_filters['veg'] && !meal.isVegetarian)return false;
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              subtitle1: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              )),
        ),
        routes: {
         TabsScreen.routeName: (ctx) => TabsScreen(favoriteMeals),
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(availableMeals),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite,_isFavorite),
          SettingsScreen.routeName: (ctx) => SettingsScreen(_filters),
        });
  }
}
