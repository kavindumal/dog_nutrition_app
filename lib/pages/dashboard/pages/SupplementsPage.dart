import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'ItemPage.dart'; // Assuming this contains your ItemDescriptionPage

class Supplementspage extends StatefulWidget {
  const Supplementspage({super.key});

  @override
  _SupplementspageState createState() => _SupplementspageState();
}

class _SupplementspageState extends State<Supplementspage> {
  List<String> _filters = ['Brand', 'Type', 'Age Group'];
  String _selectedSort = 'Price: Low to High';
  List<Map<String, dynamic>> _products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('products')
          .where('type', isEqualTo: 'Supplements') // Filter products where type is 'Dry'
          .get();

      List<Map<String, dynamic>> products = snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      setState(() {
        _products = products;
        _sortProducts(_selectedSort);
      });
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

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
                value: true, // You can manage the filter state as needed
                onChanged: (bool? value) {
                  // Handle filter change
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
      backgroundColor: const Color(0xFFE8F6FF),
      appBar: AppBar(
        title: const Text('Supplements'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: _showFilterDialog,
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

  Widget _buildSortingOptions() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text('Sort by:'),
          const SizedBox(width: 8),
          DropdownButton<String>(
            dropdownColor: const Color(0xFFE8F6FF),
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
    if (_products.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDescriptionPage(productName: product['name']),
              ),
            );
          },
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Image.network(
                product['image'],
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
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
          ),
        );
      },
    );
  }
}
