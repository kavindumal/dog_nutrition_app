import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F6FF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Shop'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: const Text('Shop Page Content Here'),
      ),
    );
  }
}
