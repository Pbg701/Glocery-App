import 'package:flutter/material.dart';

// PRODUCT MODEL
class Product {
  final String imagePath;
  final String name;
  final String description;
  final double price;
  int quantity; // Add quantity field

  Product({
    required this.imagePath,
    required this.name,
    required this.description,
    required this.price,
    this.quantity = 1, // Initialize quantity with a default value
  });
}

// PRODUCT LIST PROVIDER
class ProductProvider with ChangeNotifier {
  final List<Product> _exclusiveOffers = [
    Product(
      imagePath: 'assets/Images/banana.png',
      name: 'Organic Bananas',
      description: '7pcs, Priceg',
      price: 70.00,
    ),
    Product(
      imagePath: 'assets/Images/pngfuel 1.png',
      name: 'Red Apple',
      description: '1Kg, Priceg',
      price: 30.00,
    ),
  ];

  final List<Product> _bestSelling = [
    Product(
      imagePath: 'assets/Images/dhobi.png',
      name: 'Fresh Carrot',
      description: '1Kg, Priceg',
      price: 10.00,
    ),
    Product(
      imagePath: 'assets/Images/pngfuel 3.png',
      name: 'Organic Gajar',
      description: '500g, Priceg',
      price: 25.00,
    ),
  ];

  final List<Product> _groceries = [
    Product(
      imagePath: 'assets/Images/Beef Bone.png',
      name: 'Beef Bone',
      description: '1Kg, Priceg',
      price: 80.00,
    ),
    Product(
      imagePath: 'assets/Images/pngfuel 5.png',
      name: 'Broiler chicken',
      description: '1Kg, Priceg',
      price: 70.00,
    ),
  ];

  List<Product> get exclusiveOffers => _exclusiveOffers;
  List<Product> get bestSelling => _bestSelling;
  List<Product> get groceries => _groceries;
}

class CartProvider with ChangeNotifier {
  List<Product> cartItems = [];

  CartProvider(int i, Function(dynamic total, dynamic current) param1);

  void addItem(Product product) {
    // Check if the product is already in the cart
    final existingProductIndex =
        cartItems.indexWhere((p) => p.name == product.name);
    if (existingProductIndex != -1) {
      // Increase quantity if the product is already in the cart
      cartItems[existingProductIndex].quantity++;
    } else {
      // Add new product to the cart
      cartItems.add(product);
    }
    notifyListeners();
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  void increaseQuantity(int index) {
    cartItems[index].quantity++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      notifyListeners();
    }
  }
}
