import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';


class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("No Meals Here"),
      );
    }
    else {
      return  Scaffold(
      appBar: AppBar(
        title: Text("Favorite Meals "),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imgUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
            
          );
        },
        itemCount: favoriteMeals.length,
      ),
    );
    }
  }
}
