import 'package:flutter/material.dart';
import '../services/fake_db_service.dart';
import '../models/meal.dart';

class MealHistoryScreen extends StatelessWidget {
  const MealHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meals = FakeDbService().getMeals();

    return Scaffold(
      appBar: AppBar(title: Text('История питания')),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return ListTile(
            title: Text(meal.name),
            subtitle: Text('${meal.calories} ккал'),
            trailing: Text('${meal.dateTime.hour}:${meal.dateTime.minute}'),
          );
        },
      ),
    );
  }
} 