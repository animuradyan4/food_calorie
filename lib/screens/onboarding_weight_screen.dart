import 'package:flutter/material.dart';

class OnboardingWeightScreen extends StatefulWidget {
  const OnboardingWeightScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingWeightScreen> createState() => _OnboardingWeightScreenState();
}

class _OnboardingWeightScreenState extends State<OnboardingWeightScreen> {
  bool isKg = true;
  double weight = 62;

  double get minWeight => isKg ? 35.0 : 77.0;
  double get maxWeight => isKg ? 120.0 : 264.0;

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
              "What's your current weight right now?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text('Kg'),
                  selected: isKg,
                  onSelected: (selected) {
                    setState(() {
                      isKg = true;
                      // Ensure weight is within valid range
                      if (weight < 35 || weight > 120) {
                        weight = 62;
                      }
                    });
                  },
                  selectedColor: Colors.white,
                  backgroundColor: Colors.white24,
                  labelStyle: TextStyle(
                    color: isKg ? const Color(0xFFD7E97A) : Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                ChoiceChip(
                  label: const Text('Lbs'),
                  selected: !isKg,
                  onSelected: (selected) {
                    setState(() {
                      isKg = false;
                      // Ensure weight is within valid range
                      if (weight < 77 || weight > 264) {
                        weight = 110;
                      }
                    });
                  },
                  selectedColor: Colors.white,
                  backgroundColor: Colors.white24,
                  labelStyle: TextStyle(
                    color: !isKg ? const Color(0xFFD7E97A) : Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              '${weight.toInt()} ${isKg ? "Kg" : "Lbs"}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            Slider(
              value: weight,
              min: minWeight,
              max: maxWeight,
              divisions: 30,
              onChanged: (val) {
                setState(() {
                  weight = val;
                });
              },
              activeColor: Colors.white,
              inactiveColor: Colors.white38,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/onboarding-goal');
                },
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
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.white70,
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