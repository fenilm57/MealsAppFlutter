import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_item.dart';
import '../models/dummy_data.dart';

// Home Screen which displays all the types of dishes

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map(
            (e) => CategoryItem(e.id, e.color, e.title),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
