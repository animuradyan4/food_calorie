import 'package:flutter/material.dart';

class OnboardingAgeScreen extends StatefulWidget {
  const OnboardingAgeScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingAgeScreen> createState() => _OnboardingAgeScreenState();
}

class _OnboardingAgeScreenState extends State<OnboardingAgeScreen> {
  int selectedAge = 20;
  
  @override
  void initState() {
    super.initState();
    // Set initial age to 20 (index 5 since we start from 15)
    selectedAge = 20;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            // Logo placeholder
            Container(
              height: 48,
              width: 120,
              decoration: const BoxDecoration(
                color: Color(0xFF3BCA6D),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: const Center(
                child: Text(
                  'COMPLEAT',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "What's your Age?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: 60,
                diameterRatio: 1.2,
                perspective: 0.003,
                physics: const FixedExtentScrollPhysics(),
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedAge = 15 + index;
                  });
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    int age = 15 + index;
                    bool isSelected = age == selectedAge;
                    return Center(
                      child: Container(
                        decoration: isSelected
                            ? BoxDecoration(
                                color: const Color(0xFFD7E97A),
                                borderRadius: BorderRadius.circular(12),
                              )
                            : null,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                        child: Text(
                          '$age',
                          style: TextStyle(
                            fontSize: isSelected ? 32 : 24,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected ? Colors.white : Colors.grey,
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: 70, // 15-84 years
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/onboarding-weight');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD7E97A),
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
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/onboarding-weight');
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
} 