import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void _selectCategory(BuildContext context) {

    /**
     * Different then Android, with the help of builder function, we return a
     * widget which then get pushed to the application stack page.
     */
    // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
    //   return CategoryMealsScreen(id,title);
    // }));

    /**
     * Similar to setting intent data in Android, here kind of similar to
     * above process but here we are using routes, on which we set in the main.dart file
     * on which we pass values as arguments or to be precise as intent as we did in android
     * and the help of Modal.of(context).settings.arguments we can receive those argument in the
     * target screen
     */
    Navigator.of(context).pushNamed('/categories-meals', arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
