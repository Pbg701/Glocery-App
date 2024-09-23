import 'package:flutter/material.dart';
import 'package:glocery_app/View/ExploreScreen/explore_screen.dart';
import 'package:glocery_app/View/favorite_screen.dart';
import 'package:glocery_app/View/HomeScreen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'orderAcceptscreen/order_accept_screen.dart';
import '../Controller/provider.dart'; // Import CartProvider

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int _selectedIndex = 2;

  // Function to handle the navigation when an item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to respective screens based on the index
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductExplorerScreen()),
      );
    }
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoriteScreen()),
      );
    }
  }

  // Function to calculate total price from the cart provider
  double calculateTotalPrice(CartProvider cartProvider) {
    return cartProvider.cartItems.fold(
        0, (total, current) => total + (current.price * current.quantity));
  }

  // Function to open the bottom sheet for checkout
  void openCheckoutBottomSheet(CartProvider cartProvider) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.7,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Delivery'),
                  subtitle: Text(
                    'Select Method',
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Implement delivery method selection
                  },
                ),
                ListTile(
                  title: Text(
                    'Payment',
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset("assets/Images/card.png"),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Promo Code'),
                  subtitle: Text(
                    'Pick discount',
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
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
                      '₹${calculateTotalPrice(cartProvider).toStringAsFixed(2)}',
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  child: Text(
                    'By placing an order you agree to our\nTerms and Conditions',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderAcceptedScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Place Order',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
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
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Call the function on tap
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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Container(
                              width: 70,
                              height: 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(cartItems[index].imagePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        cartItems[index].name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: SizedBox(
                                          height: 14,
                                          width: 9,
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.close,
                                              color: Color.fromRGBO(
                                                  179, 179, 179, 1),
                                            ),
                                            onPressed: () {
                                              cartProvider.cartItems
                                                  .removeAt(index);
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    cartItems[index].description,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Container(
                                        height: 45.67,
                                        width: 45.67,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromRGBO(
                                                240, 240, 240, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(17),
                                        ),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Color.fromRGBO(
                                                179, 179, 179, 1),
                                          ),
                                          onPressed: () => cartProvider
                                              .decreaseQuantity(index),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '${cartItems[index].quantity}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        height: 45.67,
                                        width: 45.67,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromRGBO(
                                                226, 226, 226, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(17),
                                        ),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.add,
                                            color:
                                                Color.fromRGBO(83, 177, 177, 1),
                                          ),
                                          onPressed: () => cartProvider
                                              .increaseQuantity(index),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '₹${calculateTotalPrice(cartProvider).toString()}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Add the bottom button here
                GestureDetector(
                  onTap: () {
                    openCheckoutBottomSheet(cartProvider);
                  },
                  child: Container(
                    width: 364,
                    height: 67,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(83, 177, 117, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(19),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    //color: Colors.white,
                    child: Row(
                      children: [
                        Center(
                          child: Text(
                            'Go to Checkout',
                            style: GoogleFonts.dmSans(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 22,
                          width: 46,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Color.fromRGBO(72, 158, 103, 1)),
                          child: Center(
                            child: Text(
                              '₹${calculateTotalPrice(cartProvider).toStringAsFixed(0)}',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     openCheckoutBottomSheet(cartProvider);
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: const Color.fromRGBO(
                        //         72, 158, 103, 1), // Button color
                        //     padding: const EdgeInsets.symmetric(vertical: 16),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //   ),
                        //   child: Text(
                        //     '₹${calculateTotalPrice(cartProvider).toStringAsFixed(1)}',
                        //     style: const TextStyle(
                        //         color: Color.fromARGB(255, 225, 13, 13),
                        //         fontSize: 18),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
