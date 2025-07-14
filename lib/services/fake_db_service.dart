import '../models/meal.dart';
import '../models/weight_entry.dart';

class FakeDbService {
  static final FakeDbService _instance = FakeDbService._internal();
  factory FakeDbService() => _instance;
  FakeDbService._internal();

  final List<Meal> _meals = [];
  final List<WeightEntry> _weights = [];

  // Meals
  List<Meal> getMeals() => List.unmodifiable(_meals);

  void addMeal(Meal meal) {
    _meals.add(meal);
  }

  void deleteMeal(String id) {
    _meals.removeWhere((m) => m.id == id);
  }

  // Weights
  List<WeightEntry> getWeights() => List.unmodifiable(_weights);

  void addWeight(WeightEntry entry) {
    _weights.add(entry);
  }
} 