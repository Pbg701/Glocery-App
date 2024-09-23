/// beverages_grid.dart
/// This widget builds a grid of beverage items using the `BeverageCard` widget for each item.

import 'package:flutter/material.dart';
import 'beverage_card.dart';

final List<Map<String, String>> beverages = [
  // Dummy data
  {
    'imageUrl': 'assets/Images/dietcoke.png',
    'name': 'Diet Coke',
    'size': '355ml, Price',
    'price': '1.99',
  },
  {
    'imageUrl': 'assets/Images/sprite.png',
    'name': 'Sprite Can',
    'size': '325ml, Price',
    'price': '1.50',
  },
  {
    'imageUrl': 'assets/Images/applejoice.png',
    'name': 'Apple & Grape Juice',
    'size': '2L, Price',
    'price': '15.99',
  },
  {
    'imageUrl': 'assets/Images/slice.png',
    'name': 'Orange Juice',
    'size': '2L, Price',
    'price': '15.99',
  },
  {
    'imageUrl': 'assets/Images/cocacola.png',
    'name': 'Coca Cola Can',
    'size': '325ml, Price',
    'price': '4.99',
  },
  {
    'imageUrl': 'assets/Images/pepsi.png',
    'name': 'Pepsi Can',
    'size': '330ml, Price',
    'price': '4.99',
  },
];

class BeveragesGrid extends StatelessWidget {
  const BeveragesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 18,
        crossAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemCount: beverages.length,
      itemBuilder: (context, index) {
        final beverage = beverages[index];
        return BeverageCard(
          imageUrl: beverage['imageUrl']!,
          name: beverage['name']!,
          size: beverage['size']!,
          price: double.parse(beverage['price']!),
        );
      },
    );
  }
}
