import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F6FF),
      appBar: AppBar(
        title: const Text('Shop'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: const Text('Cart Page Content Here'),
      ),
    );
  }
}
