import 'package:flutter/material.dart';
import 'package:glocery_app/View/ExploreScreen/explore_screen.dart';
import 'package:glocery_app/View/favorite_screen.dart';
import 'package:glocery_app/View/my_cart_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/product_card.dart';
import 'widgets/search_bar.dart';
import 'widgets/section_header.dart';
import 'widgets/vegetables_offer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductExplorerScreen()),
      );
    }

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ShoppingCart()),
      );
    }

    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoriteScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      // backgroundColor: Color.fromRGBO(242, 243, 242, 1),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.05),
              const Center(
                child: Image(image: AssetImage("assets/Images/gajar.png")),
              ),
              const SizedBox(height: 14),
              Container(
                alignment: Alignment.center,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_outlined,
                        color: Color.fromRGBO(57, 54, 54, 1), size: 23),
                    SizedBox(width: 10),
                    Text(
                      "Dhaka, Banassre",
                      style: TextStyle(
                        color: Color.fromRGBO(76, 79, 77, 1),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              const SearchField(
                screenWidth: 364,
              ),

              // const SearchBar(), // Added SearchBar Widget
              SizedBox(height: screenHeight * 0.03),
              const VegetablesOffer(), // Added VegetablesOffer Widget
              SizedBox(height: screenHeight * 0.03),
              SectionHeader(screenWidth: screenWidth, title: "Exclusive Offer"),
              SizedBox(height: screenHeight * 0.03),
              const ProductCards(category: "exclusive"),
              SizedBox(height: screenHeight * 0.03),
              SectionHeader(screenWidth: screenWidth, title: "Best Selling"),
              SizedBox(height: screenHeight * 0.03),
              const ProductCards(category: "bestSelling"),
              SizedBox(height: screenHeight * 0.03),
              SectionHeader(screenWidth: screenWidth, title: "Groceries"),
              SizedBox(height: screenHeight * 0.03),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 105,
                      width: 248,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(248, 164, 76, 1)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 71,
                              width: 71,
                              child: Image.asset("assets/Images/pulses.png"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              //width: 63,
                              child: Text(
                                "Pulses",
                                style: GoogleFonts.dmSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 105,
                      width: 248,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(83, 177, 117, 1)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 71,
                              width: 71,
                              child: Image.asset("assets/Images/rise.png"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              //width: 63,
                              child: Text(
                                "Rice",
                                style: GoogleFonts.dmSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              const ProductCards(category: "groceries"),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
