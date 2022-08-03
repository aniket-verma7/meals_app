import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  static const String routeName = '/';
  final List<Meal> _favoriteMeals;

  TabsScreen(this._favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  List<Widget> _pages;

  @override
  void initState() {
    _pages = [
      CategoriesScreen(),
      FavoritesScreen(widget._favoriteMeals),
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((_selectedPageIndex == 0 ? 'Categories' : 'Favorites')),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            label: 'Category',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(Icons.star),
          )
        ],
      ),
    );
  }
}

// Widget appBarBottomViewPager() {
//   return DefaultTabController(
//     length: 2,
//     child: Scaffold(
//       appBar: AppBar(
//         title: Text('Meals'),
//         bottom: TabBar(
//           tabs: [
//             Tab(
//               icon: Icon(Icons.category),
//               text: 'Categories',
//             ),
//             Tab(
//               icon: Icon(Icons.star),
//               text: 'Favorites',
//             )
//           ],
//         ),
//       ),
//       body: TabBarView(
//         children: [
//           CategoriesScreen(),
//           CategoriesScreen(),
//         ],
//       ),
//     ),
//   );
// }
