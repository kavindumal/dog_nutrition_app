import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F6FF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile Settings'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: const Text('Me Page Content Here'),
      ),
    );
  }
}
