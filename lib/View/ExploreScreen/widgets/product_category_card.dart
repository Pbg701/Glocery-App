import 'package:flutter/material.dart';

/// A custom widget that represents a product category card.
///
/// Displays an image, title, and has a background color with border.
/// It is used in the product explorer screen to display different
/// product categories.
class ProductCategoryCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Color bgColor;

  const ProductCategoryCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: bgColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(imageUrl),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
