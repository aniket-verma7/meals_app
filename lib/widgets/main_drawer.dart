import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/settings_screen.dart';
import 'package:meals_app/screens/tab_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title,IconData icon,BuildContext context){
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: (){
        if(title == 'Meals'){
          Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
        }
        else{
          Navigator.of(context).pushReplacementNamed(SettingsScreen.routeName);
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Meals App',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals',Icons.restaurant,context),
          buildListTile('Settings',Icons.settings,context)
        ],
      ),
    );
  }
}
