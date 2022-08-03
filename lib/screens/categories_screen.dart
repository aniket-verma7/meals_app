import 'package:flutter/material.dart';
import 'package:meals_app/constants/dummy_data.dart';
import 'package:meals_app/widgets/categort_item.dart';

class CategoriesScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      children: DUMMY_CATEGORIES.map((item) {
        print(200*2.5);
        return CategoryItem(item.id,item.title, item.color);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio:1.5,
        crossAxisSpacing: 20,//vertical space
        mainAxisSpacing: 20,//horizontal space
      ),
    );
  }
}
