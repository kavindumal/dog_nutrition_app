import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F6FF),
      appBar: AppBar(
        title: const Text('Shop'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: const Text('Home Page Content Here'),
      ),
    );
  }
}