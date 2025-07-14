import 'package:flutter/material.dart';

class OnboardingWelcomeScreen extends StatelessWidget {
  const OnboardingWelcomeScreen({Key? key}) : super(key: key);

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
            const SizedBox(height: 16),
            // Fruits & bowl illustration placeholder
            Container(
              height: 160,
              width: 160,
              decoration: const BoxDecoration(
                color: Color(0x33D7E97A),
                borderRadius: BorderRadius.all(Radius.circular(80)),
              ),
              child: const Icon(
                Icons.restaurant,
                size: 80,
                color: Color(0xFF3BCA6D),
              ),
            ),
            const SizedBox(height: 24),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: 'Track Your '),
                    TextSpan(
                      text: 'Nutrition',
                      style: TextStyle(color: Color(0xFF3BCA6D)),
                    ),
                    TextSpan(text: ',\nTransform Your '),
                    TextSpan(
                      text: 'Health',
                      style: TextStyle(color: Color(0xFFD7E97A)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Stay healthy by tracking every meal.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const Spacer(),
            // Continue button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/onboarding-age');
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
                Navigator.pushNamed(context, '/onboarding-age');
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