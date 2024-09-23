import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A reusable widget that displays a section header with a title and a "See all" button
class SectionHeader extends StatelessWidget {
  final double screenWidth;
  final String title;

  const SectionHeader({
    super.key,
    required this.screenWidth,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 31,
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 31,
          child: Text(
            "See all",
            style: GoogleFonts.poppins(
              color: const Color.fromRGBO(83, 177, 117, 1),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
      ],
    );
  }
}
