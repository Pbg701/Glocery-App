import 'package:flutter/material.dart';
import 'product_category_card.dart';
import 'package:glocery_app/View/BeverageScreen/beverage.dart';
import 'package:glocery_app/View/search_screen.dart';

/// A widget that displays a grid of product categories.
/// Each category is displayed as a [ProductCategoryCard].
class ProductCategoriesGrid extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final List<Map<String, dynamic>> filteredCategories;

  const ProductCategoriesGrid({
    super.key,
    required this.categories,
    required this.filteredCategories,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: filteredCategories.length,
      itemBuilder: (context, index) {
        final category = filteredCategories[index];
        return GestureDetector(
          onTap: () {
            if (category['title'] == 'Beverages') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BeveragesScreen()),
              );
            } else if (category['title'] == 'Dairy & Eggs') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            }
          },
          child: ProductCategoryCard(
            imageUrl: category['imageUrl'],
            title: category['title'],
            bgColor: category['bgColor'],
          ),
        );
      },
    );
  }
}
