import 'package:flutter/material.dart';
import '../services/fake_db_service.dart';
import '../models/weight_entry.dart';

class WeightTrackerScreen extends StatefulWidget {
  const WeightTrackerScreen({Key? key}) : super(key: key);

  @override
  State<WeightTrackerScreen> createState() => _WeightTrackerScreenState();
}

class _WeightTrackerScreenState extends State<WeightTrackerScreen> {
  final _weightController = TextEditingController();

  void _addWeight() {
    if (_weightController.text.isNotEmpty) {
      final entry = WeightEntry(
        date: DateTime.now(),
        weight: double.tryParse(_weightController.text) ?? 0,
      );
      FakeDbService().addWeight(entry);
      setState(() {});
      _weightController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final weights = FakeDbService().getWeights();
    return Scaffold(
      appBar: AppBar(title: Text('Отслеживание веса')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _weightController,
                    decoration: InputDecoration(labelText: 'Вес (кг)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addWeight,
                  child: Text('Добавить'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: weights.length,
              itemBuilder: (context, index) {
                final entry = weights[index];
                return ListTile(
                  title: Text('${entry.weight} кг'),
                  subtitle: Text('${entry.date.day}.${entry.date.month}.${entry.date.year}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 