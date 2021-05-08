import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;
  FavouriteScreen(this.favouriteMeal);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return Container(
        child: Text('You have no Favourites yet!!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeal[index].id,
            affordability: favouriteMeal[index].affordability,
            complexity: favouriteMeal[index].complexity,
            duration: favouriteMeal[index].duration,
            imageUrl: favouriteMeal[index].imageUrl,
            title: favouriteMeal[index].title,
          );
        },
        itemCount: favouriteMeal.length,
      );
    }
  }
}
