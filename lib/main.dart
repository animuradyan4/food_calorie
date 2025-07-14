import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/nutrition_screen.dart';
import 'screens/progress_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/scan_screen.dart';
import 'screens/daily_nutrition_screen.dart';
import 'screens/onboarding_welcome_screen.dart';
import 'screens/onboarding_age_screen.dart';
import 'screens/onboarding_weight_screen.dart';
import 'screens/onboarding_goal_screen.dart';
import 'screens/onboarding_gender_screen.dart';
import 'screens/add_manual_screen.dart';

void main() {
  runApp(const FoodCalorieApp());
}

class FoodCalorieApp extends StatelessWidget {
  const FoodCalorieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Calorie App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      initialRoute: '/onboarding-welcome',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/nutrition': (context) => const NutritionScreen(),
        '/progress': (context) => const ProgressScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/scan': (context) => const ScanScreen(),
        '/daily-nutrition': (context) => const DailyNutritionScreen(),
        '/onboarding-welcome': (context) => const OnboardingWelcomeScreen(),
        '/onboarding-age': (context) => const OnboardingAgeScreen(),
        '/onboarding-weight': (context) => const OnboardingWeightScreen(),
        '/onboarding-goal': (context) => const OnboardingGoalScreen(),
        '/onboarding-gender': (context) => const OnboardingGenderScreen(),
        '/add-manual': (context) => const AddManualScreen(),
      },
    );
  }
}
