import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: const Color(0xFF047BCE),
      ),
      body: Center(
        child: const Text('Cart Page Content Here'),
      ),
    );
  }
}
