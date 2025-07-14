import 'package:flutter/material.dart';

class DailyNutritionScreen extends StatelessWidget {
  const DailyNutritionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Daily Nutrition',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFD7E97A), Color(0xFFB8D95A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sunday, December 15, 2024',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDailyStat('Calories', '1,247', '1,800', 'kcal'),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      _buildDailyStat('Remaining', '553', '', 'kcal'),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      _buildDailyStat('Goal', '69%', '', ''),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Macro Breakdown
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Macro Breakdown',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildMacroProgress('Protein', 89, 120, 'g', const Color(0xFFD7E97A)),
                  const SizedBox(height: 12),
                  _buildMacroProgress('Carbohydrates', 156, 200, 'g', const Color(0xFF6C63FF)),
                  const SizedBox(height: 12),
                  _buildMacroProgress('Fat', 45, 65, 'g', const Color(0xFFFF6B6B)),
                  const SizedBox(height: 12),
                  _buildMacroProgress('Fiber', 18, 25, 'g', const Color(0xFFFFB74D)),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Meals Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Today\'s Meals',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Color(0xFFD7E97A)),
                  label: const Text(
                    'Add Meal',
                    style: TextStyle(
                      color: Color(0xFFD7E97A),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Breakfast
            _buildMealSection(
              'Breakfast',
              '08:30 AM',
              Icons.wb_sunny,
              const Color(0xFFFFB74D),
              [
                _buildFoodItem('Oatmeal with Berries', '1 cup', '150 kcal', 'Protein: 6g, Carbs: 27g, Fat: 3g'),
                _buildFoodItem('Greek Yogurt', '1/2 cup', '80 kcal', 'Protein: 15g, Carbs: 6g, Fat: 0g'),
                _buildFoodItem('Banana', '1 medium', '90 kcal', 'Protein: 1g, Carbs: 23g, Fat: 0g'),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Lunch
            _buildMealSection(
              'Lunch',
              '12:30 PM',
              Icons.wb_sunny_outlined,
              const Color(0xFF81C784),
              [
                _buildFoodItem('Grilled Chicken Breast', '150g', '165 kcal', 'Protein: 31g, Carbs: 0g, Fat: 3.6g'),
                _buildFoodItem('Mixed Green Salad', '100g', '25 kcal', 'Protein: 2g, Carbs: 4g, Fat: 0.3g'),
                _buildFoodItem('Olive Oil Dressing', '15ml', '120 kcal', 'Protein: 0g, Carbs: 0g, Fat: 14g'),
                _buildFoodItem('Quinoa', '1/2 cup', '111 kcal', 'Protein: 4g, Carbs: 20g, Fat: 2g'),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Snack
            _buildMealSection(
              'Snack',
              '03:00 PM',
              Icons.coffee,
              const Color(0xFF64B5F6),
              [
                _buildFoodItem('Apple', '1 medium', '95 kcal', 'Protein: 0.5g, Carbs: 25g, Fat: 0.3g'),
                _buildFoodItem('Almonds', '10 pieces', '70 kcal', 'Protein: 2.5g, Carbs: 2g, Fat: 6g'),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Dinner
            _buildMealSection(
              'Dinner',
              '07:00 PM',
              Icons.nights_stay,
              const Color(0xFF9C27B0),
              [
                _buildFoodItem('Salmon Fillet', '120g', '280 kcal', 'Protein: 34g, Carbs: 0g, Fat: 16g'),
                _buildFoodItem('Steamed Broccoli', '100g', '35 kcal', 'Protein: 3g, Carbs: 7g, Fat: 0.4g'),
                _buildFoodItem('Brown Rice', '1/2 cup', '108 kcal', 'Protein: 2.5g, Carbs: 22g, Fat: 0.9g'),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Water Intake
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Water Intake',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        '6/8 glasses',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: List.generate(8, (index) {
                      bool isFilled = index < 6;
                      return Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          height: 40,
                          decoration: BoxDecoration(
                            color: isFilled ? const Color(0xFF64B5F6) : Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.water_drop,
                            color: isFilled ? Colors.white : Colors.grey,
                            size: 20,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Summary Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFD7E97A).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFD7E97A).withOpacity(0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.insights,
                        color: const Color(0xFFD7E97A),
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Daily Summary',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD7E97A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Great job today! You\'re on track with your nutrition goals. Your protein intake is excellent, and you\'ve maintained a good balance of macronutrients.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyStat(String label, String value, String target, String unit) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        if (target.isNotEmpty)
          Text(
            '/ $target $unit',
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white70,
            ),
          )
        else
          Text(
            unit,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white70,
            ),
          ),
      ],
    );
  }

  Widget _buildMacroProgress(String label, int current, int target, String unit, Color color) {
    double progress = current / target;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            Text(
              '$current/$target $unit',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress.clamp(0.0, 1.0),
          backgroundColor: Colors.grey.withOpacity(0.2),
          valueColor: AlwaysStoppedAnimation<Color>(color),
          minHeight: 8,
        ),
      ],
    );
  }

  Widget _buildMealSection(String mealName, String time, IconData icon, Color color, List<Widget> foodItems) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Meal Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mealName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
          
          // Food Items
          ...foodItems.map((item) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: item,
          )),
          
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildFoodItem(String name, String serving, String calories, String macros) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                serving,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            calories,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFD7E97A),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            macros,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
} 