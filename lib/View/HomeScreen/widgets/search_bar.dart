// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// /// A reusable search bar widget with custom styling
// class SearchBar extends StatelessWidget {
//   const SearchBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Container(
//       width: screenWidth * 0.9,
//       height: screenHeight * 0.07,
//       decoration: BoxDecoration(
//         color: const Color.fromRGBO(242, 243, 242, 1),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: TextField(
//         decoration: InputDecoration(
//           hintText: "Search here...",
//           hintStyle: GoogleFonts.poppins(
//             color: Colors.grey.shade600,
//             fontSize: 16,
//           ),
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// SearchField widget for the search bar on the HomeScreen.
/// It accepts screenWidth for responsive design.
class SearchField extends StatelessWidget {
  final double screenWidth;

  const SearchField({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(242, 243, 242, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search here...",
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey.shade600,
            fontSize: 16,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        ),
      ),
    );
  }
}
