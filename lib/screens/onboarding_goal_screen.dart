import 'package:flutter/material.dart';

class OnboardingGoalScreen extends StatefulWidget {
  const OnboardingGoalScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingGoalScreen> createState() => _OnboardingGoalScreenState();
}

class _OnboardingGoalScreenState extends State<OnboardingGoalScreen> {
  String? selectedGoal;

  final List<Map<String, dynamic>> goals = [
    {
      'title': 'Lose Weight',
      'description': 'Reduce body weight and fat percentage',
      'icon': Icons.trending_down,
      'color': const Color(0xFFD7E97A),
    },
    {
      'title': 'Gain Weight',
      'description': 'Build muscle and increase body weight',
      'icon': Icons.trending_up,
      'color': const Color(0xFFFF6B6B),
    },
    {
      'title': 'Maintain Weight',
      'description': 'Keep current weight and stay healthy',
      'icon': Icons.balance,
      'color': const Color(0xFF6C63FF),
    },
    {
      'title': 'Build Muscle',
      'description': 'Focus on muscle growth and strength',
      'icon': Icons.fitness_center,
      'color': const Color(0xFFFFB74D),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7E97A),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            // Logo placeholder
            Container(
              height: 48,
              width: 120,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: const Center(
                child: Text(
                  'COMPLEAT',
                  style: TextStyle(
                    color: Color(0xFFD7E97A),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "What's your main goal?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Choose the goal that best describes your fitness journey",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  final goal = goals[index];
                  final isSelected = selectedGoal == goal['title'];
                  
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGoal = goal['title'];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                        border: isSelected 
                          ? Border.all(color: Colors.white, width: 2)
                          : null,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isSelected 
                                ? goal['color'].withOpacity(0.1)
                                : Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              goal['icon'],
                              color: isSelected ? goal['color'] : Colors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  goal['title'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected ? Colors.black87 : Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  goal['description'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isSelected ? Colors.grey[600] : Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (isSelected)
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: goal['color'],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: selectedGoal != null ? () {
                      Navigator.pushNamed(context, '/onboarding-gender');
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const StadiumBorder(),
                      minimumSize: const Size(double.infinity, 48),
                      elevation: 0,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFFD7E97A),
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, color: Color(0xFFD7E97A)),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context, 
                        '/home', 
                        (route) => false
                      );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 