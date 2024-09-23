import 'package:flutter/material.dart';
import 'package:glocery_app/Controller/provider.dart';

import 'package:provider/provider.dart';

import '../../product_detail_screen.dart';

/// ProductCards widget to display a list of product cards.
/// The [category] parameter filters products accordingly.
class ProductCards extends StatelessWidget {
  final String category;

  const ProductCards({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final provider = Provider.of<ProductProvider>(context);
    List<Product> products = [];

    // Fetch product list based on category.
    if (category == "exclusive") {
      products = provider.exclusiveOffers;
    } else if (category == "bestSelling") {
      products = provider.bestSelling;
    } else if (category == "groceries") {
      products = provider.groceries;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: products.map((product) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductScreen(product: product),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.04),
              width: screenWidth * 0.45,
              height: screenHeight * 0.345,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    product.imagePath,
                    height: screenHeight * 0.11,
                  ),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    product.description,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    children: [
                      Text(
                        '₹${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addItem(product);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.all(screenWidth * 0.02),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
