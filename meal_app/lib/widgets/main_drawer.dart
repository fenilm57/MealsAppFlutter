import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile({IconData icon, String title, Function function}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      onTap: function,
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
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              'Cooking!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            icon: Icons.restaurant,
            title: 'Meals',
            function: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          buildListTile(
            icon: Icons.settings,
            title: 'Filters',
            function: () {
              Navigator.pushReplacementNamed(context, FliterScreen.pageRoute);
            },
          ),
        ],
      ),
    );
  }
}
