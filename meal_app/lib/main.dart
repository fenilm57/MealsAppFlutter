import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meal_app/models/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_meal_screen.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_display_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favouriteMeal = [];

  void toggleFavourites(String mealId) {
    final existingIndex =
        _favouriteMeal.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeal.add(
          DUMMY_MEALS.firstWhere((element) => element.id == mealId),
        );
      });
    }
  }

  void _channgeFilters(Map<String, bool> _filter) {
    setState(() {
      _filters = _filter;

      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['glutten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool isMealFavourite(String id) {
    return _favouriteMeal.any((element) => element.id == id);
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
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: TabsScreen(_favouriteMeal),
      routes: {
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(_availableMeal),
        MealDisplayScreen.nameRoute: (_) => MealDisplayScreen(
              toggleFavourites,
              isMealFavourite,
            ),
        FliterScreen.pageRoute: (_) => FliterScreen(_filters, _channgeFilters),
      },
    );
  }
}
