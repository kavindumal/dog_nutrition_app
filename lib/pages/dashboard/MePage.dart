import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color(0xFF047BCE),
      ),
      body: Center(
        child: const Text('Profile Page Content Here'),
      ),
    );
  }
}
