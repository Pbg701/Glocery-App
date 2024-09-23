import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // State for categories checkboxes
  bool isEggsSelected = true;
  bool isNoodlesSelected = false;
  bool isChipsSelected = false;
  bool isFastFoodSelected = false;

  // State for brand checkboxes
  bool isCocolaSelected = true;
  bool isIndividualCollectionSelected = false;
  bool isIfadSelected = false;
  bool isKaziFarmasSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filters',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // Close button logic
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Categories Checkboxes
              CheckboxListTile(
                title: const Text('Eggs'),
                value: isEggsSelected,
                onChanged: (bool? value) {
                  setState(() {
                    isEggsSelected = value ?? false;
                  });
                },
                activeColor: Colors.green,
              ),
              CheckboxListTile(
                title: const Text('Noodles & Pasta'),
                value: isNoodlesSelected,
                onChanged: (bool? value) {
                  setState(() {
                    isNoodlesSelected = value ?? false;
                  });
                },
                activeColor: Colors.green,
              ),
              CheckboxListTile(
                title: const Text('Chips & Crisps'),
                value: isChipsSelected,
                onChanged: (bool? value) {
                  setState(() {
                    isChipsSelected = value ?? false;
                  });
                },
                activeColor: Colors.green,
              ),
              CheckboxListTile(
                title: const Text('Fast Food'),
                value: isFastFoodSelected,
                onChanged: (bool? value) {
                  setState(() {
                    isFastFoodSelected = value ?? false;
                  });
                },
                activeColor: Colors.green,
              ),
              const SizedBox(height: 16),
              const Text(
                'Brand',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Brand Checkboxes
              CheckboxListTile(
                title: const Text('Individual Collection'),
                value: isIndividualCollectionSelected,
                onChanged: (bool? value) {
                  setState(() {
                    isIndividualCollectionSelected = value ?? false;
                  });
                },
                activeColor: Colors.green,
              ),
              CheckboxListTile(
                title: const Text('Cocola'),
                value: isCocolaSelected,
                onChanged: (bool? value) {
                  setState(() {
                    isCocolaSelected = value ?? false;
                  });
                },
                activeColor: Colors.green,
              ),
              CheckboxListTile(
                title: const Text('Ifad'),
                value: isIfadSelected,
                onChanged: (bool? value) {
                  setState(() {
                    isIfadSelected = value ?? false;
                  });
                },
                activeColor: Colors.green,
              ),
              CheckboxListTile(
                title: const Text('Kazi Farmas'),
                value: isKaziFarmasSelected,
                onChanged: (bool? value) {
                  setState(() {
                    isKaziFarmasSelected = value ?? false;
                  });
                },
                activeColor: Colors.green,
              ),
              const Spacer(),
              // Apply Filter Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Apply filter logic
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'Apply Filter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
