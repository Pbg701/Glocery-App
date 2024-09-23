import 'package:flutter/material.dart';


class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  // Sample data
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Bell Pepper Red',
      'image': 'assets/Images/dhobi.png',
      'set': '1kg, Price',
      'quantity': 1,
      'price': 4.99,
    },
    {
      'name': 'Egg Chicken Red',
      'image': 'assets/Images/egg red.png',
      'set': '4pcs, Price',
      'quantity': 1,
      'price': 1.99,
    },
    {
      'name': 'Organic Bananas',
      'image': 'assets/Images/banana.png',
      'set': '12kg, Price',
      'quantity': 1,
      'price': 3.00,
    },
    {
      'name': 'Ginger',
      'image': 'assets/Images/ginger.png',
      'set': '250gm, Price',
      'quantity': 1,
      'price': 2.99,
    },
  ];

  // Calculate total price
  double get totalPrice {
    return cartItems.fold(0,
        (total, current) => total + (current['price'] * current['quantity']));
  }

  // Function to increase quantity
  void increaseQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  // Function to decrease quantity
  void decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  // Function to open the bottom sheet for checkout
  void openCheckoutBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the modal to take up more space
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.7, // Controls the height of the bottom sheet
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.close),
                    ],
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Delivery'),
                  subtitle: const Text('Select Method'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Implement delivery method selection
                  },
                ),
                ListTile(
                  title: const Text('Payment'),
                  subtitle: const Text('Select Payment Method'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Implement payment method selection
                  },
                ),
                ListTile(
                  title: const Text('Promo Code'),
                  subtitle: const Text('Pick discount'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Implement promo code selection
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Cost',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement the order placement logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text(
                      'Place Order',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'By placing an order you agree to our\nTerms and Conditions',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: Image.asset(cartItems[index]['image'],
                        width: 50, height: 50),
                    title: Row(
                      children: [
                        Text(
                          cartItems[index]['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.highlight_remove_outlined),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItems[index]['set'],
                          style: const TextStyle(
                            color: Color.fromRGBO(124, 124, 124, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromRGBO(
                                          226, 226, 226, 1)),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(17),
                                  )),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.remove,
                                  color: Color.fromRGBO(179, 179, 179, 1),
                                ),
                                onPressed: () => decreaseQuantity(index),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(cartItems[index]['quantity'].toString()),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromRGBO(
                                          226, 226, 226, 1)),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(17),
                                  )),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                                onPressed: () => increaseQuantity(index),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Text(
                      '\$${cartItems[index]['price']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total: \$${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: openCheckoutBottomSheet,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: const Text(
                    'Go to Checkout',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
