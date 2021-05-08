import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/dummy_data.dart';

// when a single meal is selected to see recepie

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meal';

  final List<Meal> available;

  CategoryMealsScreen(this.available);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String title;
  List<Meal> categoryMeals;
  String id;
  var stateCheck = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if (!stateCheck) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = routeArgs['title'];
      id = routeArgs['id'];
      categoryMeals = widget.available
          .where((element) => element.categories.contains(id))
          .toList();
      stateCheck = true;
    }
  }

  void removeItem(String value) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == value);
    });
  }

  @override
  Widget build(BuildContext context) {
    void removeItem(String value) {
      setState(() {
        categoryMeals.removeWhere((element) => element.id == value);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
            // removeItem: removeItem,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
