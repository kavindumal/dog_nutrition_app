import 'package:flutter/material.dart';

class ProductCatalogPage extends StatefulWidget {
  const ProductCatalogPage({super.key});

  @override
  _ProductCatalogPageState createState() => _ProductCatalogPageState();
}

class _ProductCatalogPageState extends State<ProductCatalogPage> {
  List<String> _filters = ['Brand', 'Type', 'Age Group'];
  String _selectedSort = 'Price: Low to High';
  List<Map<String, dynamic>> _products = [
    {
      'name': 'Premium Dry Dog Food',
      'price': 39.99,
      'image': 'https://via.placeholder.com/150',
      'description': 'High-quality dry food for adult dogs. Provides balanced nutrition and promotes healthy skin and coat.',
      'brand': 'DogFoodCo',
      'type': 'Dry',
      'ageGroup': 'Adult',
      'reviews': '4.5/5 (250 reviews)',
    },
    {
      'name': 'Grain-Free Wet Food',
      'price': 29.99,
      'image': 'https://via.placeholder.com/150',
      'description': 'Grain-free wet food, perfect for sensitive stomachs. Ideal for puppies.',
      'brand': 'PetFeast',
      'type': 'Wet',
      'ageGroup': 'Puppy',
      'reviews': '4.7/5 (120 reviews)',
    },
    {
      'name': 'Senior Dog Supplements',
      'price': 19.99,
      'image': 'https://via.placeholder.com/150',
      'description': 'Supplements to boost immunity and support joint health in senior dogs.',
      'brand': 'HealthPaws',
      'type': 'Supplements',
      'ageGroup': 'Senior',
      'reviews': '4.3/5 (80 reviews)',
    },
    {
      'name': 'Senior Dog Supplements',
      'price': 25.99,
      'image': 'https://via.placeholder.com/150',
      'description': 'Supplements to boost immunity and support joint health in senior dogs.',
      'brand': 'HealthPaws',
      'type': 'Supplements',
      'ageGroup': 'Senior',
      'reviews': '4.3/5 (80 reviews)',
    },
    {
      'name': 'Senior Dog Supplements',
      'price': 06.99,
      'image': 'https://via.placeholder.com/150',
      'description': 'Supplements to boost immunity and support joint health in senior dogs.',
      'brand': 'HealthPaws',
      'type': 'Supplements',
      'ageGroup': 'Senior',
      'reviews': '4.3/5 (80 reviews)',
    },
  ];

  void _sortProducts(String sortBy) {
    setState(() {
      if (sortBy == 'Price: Low to High') {
        _products.sort((a, b) => a['price'].compareTo(b['price']));
      } else if (sortBy == 'Price: High to Low') {
        _products.sort((a, b) => b['price'].compareTo(a['price']));
      }
    });
  }

  Future<void> _showFilterDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter Products'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _filters.map((filter) {
              return CheckboxListTile(
                title: Text(filter),
                value: true,
                onChanged: (bool? value) {
                },
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Apply Filters'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F6FF),
      appBar: AppBar(
        title: const Text('Dog Food & Nutrition'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: _showFilterDialog, // Open filter dialog
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSortingOptions(),
          Expanded(child: _buildProductList()),
        ],
      ),
    );
  }

  // Sorting dropdown menu
  Widget _buildSortingOptions() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text('Sort by:'),
          const SizedBox(width: 8),
          DropdownButton<String>(
            dropdownColor: Color(0xFFE8F6FF),
            value: _selectedSort,
            items: const [
              DropdownMenuItem(value: 'Price: Low to High', child: Text('Price: Low to High')),
              DropdownMenuItem(value: 'Price: High to Low', child: Text('Price: High to Low')),
            ],
            onChanged: (value) {
              setState(() {
                _selectedSort = value!;
                _sortProducts(_selectedSort);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        return Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Image.network(product['image'], width: 80, height: 80, fit: BoxFit.cover),
            title: Text(product['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product['description']),
                const SizedBox(height: 4),
                Text('Brand: ${product['brand']}'),
                Text('Type: ${product['type']}'),
                Text('Age Group: ${product['ageGroup']}'),
                const SizedBox(height: 8),
                Text('Reviews: ${product['reviews']}', style: const TextStyle(color: Colors.grey)),
              ],
            ),
            trailing: Text(
              '\$${product['price'].toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}