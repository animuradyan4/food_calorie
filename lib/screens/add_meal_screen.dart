import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/meal.dart';
import '../services/fake_db_service.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({Key? key}) : super(key: key);

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _proteinController = TextEditingController();
  final _fatController = TextEditingController();
  final _carbsController = TextEditingController();

  void _addMeal() {
    if (_formKey.currentState!.validate()) {
      final meal = Meal(
        id: Uuid().v4(),
        dateTime: DateTime.now(),
        name: _nameController.text,
        calories: double.tryParse(_caloriesController.text) ?? 0,
        protein: double.tryParse(_proteinController.text) ?? 0,
        fat: double.tryParse(_fatController.text) ?? 0,
        carbs: double.tryParse(_carbsController.text) ?? 0,
        photoUrl: null,
      );
      FakeDbService().addMeal(meal);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Добавить прием пищи')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Название'),
                validator: (value) => value == null || value.isEmpty ? 'Введите название' : null,
              ),
              TextFormField(
                controller: _caloriesController,
                decoration: InputDecoration(labelText: 'Калории'),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty ? 'Введите калории' : null,
              ),
              TextFormField(
                controller: _proteinController,
                decoration: InputDecoration(labelText: 'Белки'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _fatController,
                decoration: InputDecoration(labelText: 'Жиры'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _carbsController,
                decoration: InputDecoration(labelText: 'Углеводы'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addMeal,
                child: Text('Добавить'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _nameController.text = 'Банан';
                    _caloriesController.text = '89';
                    _proteinController.text = '1.1';
                    _fatController.text = '0.3';
                    _carbsController.text = '23';
                  });
                },
                child: Text('Распознать по фото'),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 