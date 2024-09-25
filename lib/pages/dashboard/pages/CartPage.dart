import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Premium Dry Dog Food',
      'price': 39.99,
      'quantity': 1,
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Grain-Free Wet Food',
      'price': 29.99,
      'quantity': 2,
      'image': 'https://via.placeholder.com/150',
    },
  ];

  double _taxRate = 0.07;

  double get _subtotal {
    return _cartItems.fold(0.0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  double get _tax => _subtotal * _taxRate;

  double get _total => _subtotal + _tax;

  void _updateQuantity(int index, int quantity) {
    setState(() {
      _cartItems[index]['quantity'] = quantity;
    });
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F6FF),
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(child: _buildCartList()),
          _buildSummary(),
          _buildCheckoutButton(),
        ],
      ),
    );
  }

  Widget _buildCartList() {
    return ListView.builder(
      itemCount: _cartItems.length,
      itemBuilder: (context, index) {
        final item = _cartItems[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.network(item['image'], width: 80, height: 80, fit: BoxFit.cover),
            title: Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$${item['price'].toStringAsFixed(2)}'),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: item['quantity'] > 1
                          ? () => _updateQuantity(index, item['quantity'] - 1)
                          : null,
                    ),
                    Text(item['quantity'].toString()),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => _updateQuantity(index, item['quantity'] + 1),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeItem(index),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSummary() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSummaryRow('Subtotal', _subtotal),
          _buildSummaryRow('Tax (7%)', _tax),
          Divider(),
          _buildSummaryRow('Total', _total, isTotal: true),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, double value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: isTotal ? 18 : 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        Text('\$${value.toStringAsFixed(2)}', style: TextStyle(fontSize: isTotal ? 18 : 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }

  Widget _buildCheckoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        onPressed: () {
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Center(
          child: Text(
            'Proceed to Checkout',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}