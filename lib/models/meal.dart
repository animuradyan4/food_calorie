class Meal {
  final String id;
  final DateTime dateTime;
  final String name;
  final double calories;
  final double protein;
  final double fat;
  final double carbs;
  final String? photoUrl;

  Meal({
    required this.id,
    required this.dateTime,
    required this.name,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
    this.photoUrl,
  });
} 