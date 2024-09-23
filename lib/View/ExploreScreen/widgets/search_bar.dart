import 'package:flutter/material.dart';

/// A custom search bar widget used in the product explorer screen.
/// It allows the user to search for products within the store.
/// The [controller] controls the text input.
class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onTextChanged;

  const SearchBar({
    super.key,
    required this.controller,
    required this.onTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          // border: InputBorder.none,
          labelText: 'Search Store',
          hintText: 'Search Store',
          icon: Icon(Icons.search),
        ),
        onChanged: onTextChanged,
      ),
    );
  }
}
