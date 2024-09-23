// import 'package:flutter/material.dart';
// import 'package:glocery_app/Controller/provider.dart';
// import 'package:provider/provider.dart';

// class BeveragesScreen extends StatelessWidget {
//   const BeveragesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Beverages',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 18,
//             crossAxisSpacing: 16,
//             childAspectRatio: 0.65,
//           ),
//           itemCount: beverages.length,
//           itemBuilder: (context, index) {
//             final beverage = beverages[index];
//             return BeverageCard(
//               imageUrl: beverage['imageUrl']!,
//               name: beverage['name']!,
//               // price: beverage['price']!,
//               size: beverage['size']!,
//               price: double.parse(beverage['price']!),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class BeverageCard extends StatelessWidget {
//   final String imageUrl;
//   final String name;
//   final double price;
//   final String size;

//   const BeverageCard({
//     super.key,
//     required this.imageUrl,
//     required this.name,
//     required this.price,
//     required this.size,
//   });

//   Product get product =>
//       Product(imagePath: imageUrl, name: name, description: size, price: price);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: Image.asset(
//               imageUrl,
//               height: 80,
//               fit: BoxFit.contain,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             name,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Text(
//             size,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Colors.grey,
//             ),
//           ),
//           const Spacer(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 '\$$price',
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Container(
//                 height: 45,
//                 width: 45,
//                 decoration: const BoxDecoration(
//                   color: Colors.green,
//                   shape: BoxShape.circle,
//                 ),
//                 child: IconButton(
//                   onPressed: () {
//                     // Add item to cart logic

//                     Provider.of<CartProvider>(context, listen: false)
//                         .addItem(product);
//                   },
//                   icon: const Icon(
//                     Icons.add,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Dummy data for beverages
// final List<Map<String, String>> beverages = [
//   {
//     'imageUrl': 'assets/Images/dietcoke.png',
//     'name': 'Diet Coke',
//     'size': '355ml, Price',
//     'price': '1.99',
//   },
//   {
//     'imageUrl': 'assets/Images/sprite.png',
//     'name': 'Sprite Can',
//     'size': '325ml, Price',
//     'price': '1.50',
//   },
//   {
//     'imageUrl': 'assets/Images/applejoice.png',
//     'name': 'Apple & Grape Juice',
//     'size': '2L, Price',
//     'price': '15.99',
//   },
//   {
//     'imageUrl': 'assets/Images/slice.png',
//     'name': 'Orange Juice',
//     'size': '2L, Price',
//     'price': '15.99',
//   },
//   {
//     'imageUrl': 'assets/Images/cocacola.png',
//     'name': 'Coca Cola Can',
//     'size': '325ml, Price',
//     'price': '4.99',
//   },
//   {
//     'imageUrl': 'assets/Images/pepsi.png',
//     'name': 'Pepsi Can',
//     'size': '330ml, Price',
//     'price': '4.99',
//   },
// ];

// ignore: dangling_library_doc_comments
/// This file contains the main `BeveragesScreen` widget that displays a list of beverages.
/// It uses several other widgets like `BeveragesAppBar`, `BeveragesGrid`, etc.



import 'package:flutter/material.dart';
import 'package:glocery_app/View/BeverageScreen/widgets/beverages_grid.dart';

import 'widgets/beverages_appbar.dart';

class BeveragesScreen extends StatelessWidget {
  const BeveragesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BeveragesAppBar(), // Using the app bar widget
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: BeveragesGrid(), // Using the grid widget
      ),
    );
  }
}
