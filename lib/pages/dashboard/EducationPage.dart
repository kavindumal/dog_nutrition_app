import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education'),
        backgroundColor: const Color(0xFF047BCE),
      ),
      body: Center(
        child: const Text('Education Page Content Here'),
      ),
    );
  }
}
