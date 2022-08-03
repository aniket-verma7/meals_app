import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail-screen';
  final Function _toggleFavorite;
  final Function _isFavorite;


  MealDetailScreen(this._toggleFavorite,this._isFavorite);

  Widget buildSectionTitle(BuildContext context, String text, double space) {
    return Container(
      height: space * 0.037,
      margin: EdgeInsets.all(space * 0.002),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget buildContainer(Widget child, double space) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(space * 0.002),
      margin: EdgeInsets.all(space * 0.02),
      height: space * 0.268,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    print(meal.title);

    final appBar = AppBar(
      title: Text(meal.title),
    );

    final mediaQuery = MediaQuery.of(context);

    final space = mediaQuery.size.height -
        mediaQuery.padding.top -
        appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      body: Column(children: [
        Container(
          height: space * 0.3,
          width: double.infinity,
          child: Image.network(
            meal.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        buildSectionTitle(context, 'Ingredient', space),
        buildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            '${index + 1}. ' + '${meal.ingredients[index]}'),
                      ),
                      Divider()
                    ],
                  ),
                );
              },
              itemCount: meal.ingredients.length,
            ),
            space),
        buildSectionTitle(context, 'Steps', space),
        buildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${index + 1}. ' + '${meal.steps[index]}',
                          overflow: TextOverflow.fade,
                          softWrap: true,
                        ),
                      ),
                      Divider()
                    ],
                  ),
                );
              },
              itemCount: meal.steps.length,
            ),
            space),
      ]),
      floatingActionButton: FloatingActionButton(
        child: _isFavorite(meal)?Icon(Icons.star):Icon(Icons.star_border),
        onPressed:()=> _toggleFavorite(meal),
      ),
    );
  }
}
