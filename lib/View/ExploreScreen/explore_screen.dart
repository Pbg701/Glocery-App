// import 'package:flutter/material.dart';
// import 'package:glocery_app/View/beverage.dart';
// import 'package:glocery_app/View/favorite_screen.dart';
// import 'package:glocery_app/View/home_screen.dart';
// import 'package:glocery_app/View/my_cart_screen.dart';
// import 'package:glocery_app/View/search_screen.dart';

// class ProductExplorerScreen extends StatefulWidget {
//   const ProductExplorerScreen({super.key});

//   @override
//   State createState() => _ProductExplorerScreenState();
// }

// class _ProductExplorerScreenState extends State<ProductExplorerScreen> {
//   int _selectedIndex = 1;
//   final TextEditingController _searchController = TextEditingController();
//   final List<Map<String, dynamic>> _categories = [
//     {
//       'imageUrl': 'assets/Images/pngfuel 6.png',
//       'title': 'Fresh Fruits & Vegetable',
//       'bgColor': Colors.greenAccent
//     },
//     {
//       'imageUrl': 'assets/Images/pngfuel 8.png',
//       'title': 'Cooking Oil & Ghee',
//       'bgColor': Colors.orangeAccent
//     },
//     {
//       'imageUrl': 'assets/Images/meat.png',
//       'title': 'Meat & Fish',
//       'bgColor': Colors.redAccent
//     },
//     {
//       'imageUrl': 'assets/Images/bakery.png',
//       'title': 'Bakery & Snacks',
//       'bgColor': Colors.purpleAccent
//     },
//     {
//       'imageUrl': 'assets/Images/Group 6837.png',
//       'title': 'Dairy & Eggs',
//       'bgColor': Colors.yellowAccent
//     },
//     {
//       'imageUrl': 'assets/Images/COLDRINK.png',
//       'title': 'Beverages',
//       'bgColor': Colors.blueAccent
//     },
//   ];

//   List<Map<String, dynamic>> get _filteredCategories {
//     String searchText = _searchController.text.toLowerCase();
//     return _categories.where((category) {
//       return category['title'].toLowerCase().contains(searchText);
//     }).toList();
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     // Navigate to respective screens based on the index
//     if (index == 1) {
//       // Navigate to the Explore screen
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const ProductExplorerScreen()),
//       );
//     }

//     if (index == 0) {
//       // Navigate to the Home screen
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const HomeScreen()),
//       );
//     }
//     if (index == 2) {
//       // Navigate to the Cart screen
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const ShoppingCart()),
//       );
//     }
//     if (index == 3) {
//       // Navigate to the Favorite screen
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const FavoriteScreen()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Find Products',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         elevation: 0,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Column(
//           children: [
//             // Search Bar
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: TextField(
//                 controller: _searchController,
//                 decoration: const InputDecoration(
//                   border: InputBorder.none,
//                   hintText: 'Search Store',
//                   icon: Icon(Icons.search),
//                 ),
//                 onChanged: (text) {
//                   setState(() {}); // Refresh the list based on the search input
//                 },
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Product Categories Grid
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 16,
//                   crossAxisSpacing: 16,
//                   childAspectRatio: 1,
//                 ),
//                 itemCount: _filteredCategories.length,
//                 itemBuilder: (context, index) {
//                   final category = _filteredCategories[index];
//                   return GestureDetector(
//                     onTap: () {
//                       if (category['title'] == 'Beverages') {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const BeveragesScreen()),
//                         );
//                       } else if (category['title'] == 'Dairy & Eggs') {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const SearchScreen()),
//                         );
//                       }
//                     },
//                     child: ProductCategoryCard(
//                       imageUrl: category['imageUrl'],
//                       title: category['title'],
//                       bgColor: category['bgColor'],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped, // Call the function on tap
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
//           BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_cart), label: 'Cart'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.favorite), label: 'Favourite'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle), label: 'Account'),
//         ],
//         selectedItemColor: Colors.green,
//         unselectedItemColor: Colors.grey,
//       ),
//     );
//   }
// }

// class ProductCategoryCard extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final Color bgColor;

//   const ProductCategoryCard({
//     super.key,
//     required this.imageUrl,
//     required this.title,
//     required this.bgColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: bgColor.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: bgColor, width: 2),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Image.asset(imageUrl),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'package:glocery_app/View/favorite_screen.dart';
import 'package:glocery_app/View/HomeScreen/home_screen.dart';
import 'package:glocery_app/View/my_cart_screen.dart';

import 'widgets/bottom_navigation_bar.dart';
import 'widgets/product_categories_grid.dart';

class ProductExplorerScreen extends StatefulWidget {
  const ProductExplorerScreen({super.key});

  @override
  State createState() => _ProductExplorerScreenState();
}

class _ProductExplorerScreenState extends State<ProductExplorerScreen> {
  int _selectedIndex = 1;
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _categories = [
    {
      'imageUrl': 'assets/Images/pngfuel 6.png',
      'title': 'Fresh Fruits & Vegetable',
      'bgColor': Colors.greenAccent
    },
    {
      'imageUrl': 'assets/Images/pngfuel 8.png',
      'title': 'Cooking Oil & Ghee',
      'bgColor': Colors.orangeAccent
    },
    {
      'imageUrl': 'assets/Images/meat.png',
      'title': 'Meat & Fish',
      'bgColor': Colors.redAccent
    },
    {
      'imageUrl': 'assets/Images/bakery.png',
      'title': 'Bakery & Snacks',
      'bgColor': Colors.purpleAccent
    },
    {
      'imageUrl': 'assets/Images/Group 6837.png',
      'title': 'Dairy & Eggs',
      'bgColor': Colors.yellowAccent
    },
    {
      'imageUrl': 'assets/Images/COLDRINK.png',
      'title': 'Beverages',
      'bgColor': Colors.blueAccent
    },
  ];

  List<Map<String, dynamic>> get _filteredCategories {
    String searchText = _searchController.text.toLowerCase();
    return _categories.where((category) {
      return category['title'].toLowerCase().contains(searchText);
    }).toList();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ShoppingCart()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoriteScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Find Products'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            SearchBar(
              controller: _searchController,
              onChanged: (text) => setState(() {}),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ProductCategoriesGrid(
                categories: _categories,
                filteredCategories: _filteredCategories,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
