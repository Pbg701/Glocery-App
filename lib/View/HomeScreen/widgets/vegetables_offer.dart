import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A widget that displays the vegetables offer section
class VegetablesOffer extends StatelessWidget {
  const VegetablesOffer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.15,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8)),
        border: Border(
          top: BorderSide(color: Color.fromRGBO(242, 243, 242, 1), width: 1),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/Images/pngfuel 2.png',
              width: screenWidth * 0.13,
              height: screenHeight * 0.06,
            ),
          ),
          Positioned(
            top: 0,
            child: Image.asset(
              'assets/Images/vegetables.png',
              height: screenHeight * 0.13,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/Images/3698 1.png',
              width: screenWidth * 0.3,
              height: screenHeight * 0.08,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/Images/pngfuel 1 (1).png',
            ),
          ),
          Positioned(
            top: 43,
            right: 50,
            child: Text(
              "Fresh Vegetables",
              style: GoogleFonts.aclonica(
                  fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          Positioned(
            bottom: 15,
            right: 70,
            child: SizedBox(
              height: 39,
              width: 126,
              child: Text(
                "Get Up To 40% OFF",
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                  color: const Color.fromRGBO(83, 177, 117, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: screenWidth * 0.35,
            child: Image.asset(
              'assets/Images/Group 6812.png',
              width: screenWidth * 0.13,
            ),
          ),
        ],
      ),
    );
  }
}
