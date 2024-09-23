import 'package:flutter/material.dart';
import 'package:glocery_app/Controller/provider.dart';
import 'package:glocery_app/View/filters.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white, // White background for search bar
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Light shadow
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search,
                          color: Colors.black54), // Search icon
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Egg', // Placeholder text
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FilterScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.tune,
                            color: Colors.black54), // Filter icon
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.70,
                ),
                itemCount: beverages.length,
                itemBuilder: (context, index) {
                  final beverage = beverages[index];
                  return BeverageCard(
                    imageUrl: beverage['imageUrl']!,
                    name: beverage['name']!,
                    price: double.parse(beverage['price']!),
                    size: beverage['size']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BeverageCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  final String size;

  const BeverageCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.size,
  });

  Product get product =>
      Product(imagePath: imageUrl, name: name, description: size, price: price);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Image.asset(
              imageUrl,
              //height: 80,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: GoogleFonts.dmSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            size,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$$price',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addItem(product);
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Dummy data for beverages
final List<Map<String, String>> beverages = [
  {
    'imageUrl': 'assets/Images/egg red.png',
    'name': 'Diet Coke',
    'size': '355ml, Price',
    'price': '1.99',
  },
  {
    'imageUrl': 'assets/Images/eggwhite.png',
    'name': 'Sprite Can',
    'size': '325ml, Price',
    'price': '1.50',
  },
  {
    'imageUrl': 'assets/Images/eggpasta.png',
    'name': 'Apple & Grape Juice',
    'size': '2L, Price',
    'price': '15.99',
  },
  {
    'imageUrl': 'assets/Images/egg-noodle.png',
    'name': 'Orange Juice',
    'size': '2L, Price',
    'price': '15.99',
  },
  {
    'imageUrl': 'assets/Images/Mayonnaise-Eggless.png',
    'name': 'Coca Cola Can',
    'size': '325ml, Price',
    'price': '4.99',
  },
  {
    'imageUrl': 'assets/Images/eggnoodle.png',
    'name': 'Pepsi Can',
    'size': '330ml, Price',
    'price': '4.99',
  },
];
