import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings-screen';

  final Map<String,bool> filters;

  SettingsScreen(this.filters);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


  Widget _buildListTile(
      String title, String subTitle, bool selection, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: selection,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust meal selection',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          _buildListTile(
              'Gluten Free', 'Only include gluten free meals.', widget.filters['gluten'],
              (newValue) {
            setState(() {
              widget.filters['gluten'] = newValue;
            });
          }),
          _buildListTile('Vegetarian', 'Only include vegetarian meals', widget.filters['veg'],
              (newValue) {
            setState(() {
              widget.filters['veg'] = newValue;
            });
          }),
          _buildListTile('Vegan', 'Only include vegan meals', widget.filters['vegan'],
              (newValue) {
            setState(() {
              widget.filters['vegan'] = newValue;
            });
          }),
          _buildListTile(
              'Lactose Free', 'Only include lactose free meals', widget.filters['lactose'],
              (newValue) {
            setState(() {
              widget.filters['lactose'] = newValue;
            });
          }),
        ],
      ),
    );
  }
}
