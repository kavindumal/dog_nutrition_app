import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F6FF),
      appBar: AppBar(
        title: const Text('Shop'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: const Text('Education Page Content Here'),
      ),
    );
  }
}
