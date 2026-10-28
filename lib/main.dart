import 'package:flutter/material.dart';

import 'food.dart';
import 'food_detail_screen.dart';

void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '103557_Restaurant menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  final List<Food> foods = const [
    Food(
      name: 'Vegetable Pizza',
      image: 'assets/images/vegetable_pizza.jpg',
      description: 'A fresh pizza topped with bell peppers, mushrooms, onions, olives and melted mozzarella.',
      price: 'RM 18.00',
    ),
    Food(
      name: 'Chicken Pizza',
      image: 'assets/images/chicken_pizza.jpg',
      description: 'Juicy grilled chicken pieces with tomato sauce, sweet corn and a generous layer of cheese.',
      price: 'RM 22.00',
    ),
    Food(
      name: 'Cheese Pizza',
      image: 'assets/images/cheese_pizza.jpg',
      description: 'The classic: a crispy crust with rich tomato sauce and three kinds of melted cheese.',
      price: 'RM 16.00',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];
          return Card(
            color: Colors.orange,
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodDetailScreen(food: food),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.orange.shade300,
                      child: Image.asset(
                        food.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.local_pizza,
                              size: 48,
                              color: Colors.white,
                            ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        food.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
