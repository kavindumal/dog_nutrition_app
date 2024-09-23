import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFF047BCE), // Your theme color
      ),
      body: Center(
        child: const Text('Home Page Content Here'),
      ),
    );
  }
}