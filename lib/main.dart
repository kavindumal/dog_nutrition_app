import 'package:dog_nutrition_app/pages/WelcomePage.dart';
import 'package:dog_nutrition_app/pages/dashboard/pages/ArticleVideoPage.dart';
import 'package:dog_nutrition_app/pages/dashboard/pages/EducationPage.dart';
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
      home: ArticleVideoPage(title: 'Nura Wasanthe ', description: 'Nura Wasanthe ', videoUrl: 'https://www.youtube.com/watch?v=x_44YS4B6Xo&list=RD70VUYE4Z2lI&index=13&pp=8AUB'),
    );
  }
}