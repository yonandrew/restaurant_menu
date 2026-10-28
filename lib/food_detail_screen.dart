import 'package:flutter/material.dart';

import 'food.dart';

class FoodDetailScreen extends StatelessWidget {
  final Food food;

  const FoodDetailScreen({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                food.image,
                height: 200,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.local_pizza,
                  size: 120,
                  color: Colors.orange,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              food.name,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              food.price,
              style: const TextStyle(fontSize: 20, color: Colors.deepOrange),
            ),
            const SizedBox(height: 16),
            Text(food.description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
