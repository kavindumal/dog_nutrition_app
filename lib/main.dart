import 'package:dog_nutrition_app/pages/CreateAccountPage.dart';
import 'package:dog_nutrition_app/pages/WelcomePage.dart';
import 'package:dog_nutrition_app/pages/dashboard/DashboardPage.dart';
import 'package:dog_nutrition_app/pages/dashboard/pages/CartPage.dart';
import 'package:dog_nutrition_app/pages/dashboard/pages/ProductListningPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Nutrition',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DashboardScreen(),
    );
  }
}