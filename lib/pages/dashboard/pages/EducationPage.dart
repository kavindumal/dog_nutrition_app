import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        'title': 'Dog Breeds',
        'description': 'Learn about different dog breeds and their specific dietary requirements.',
        'icon': Icons.pets,
        'color': Colors.blueAccent,
      },
      {
        'title': 'Nutrition Tips',
        'description': 'Explore tips and advice for feeding your dog a balanced and nutritious diet.',
        'icon': Icons.restaurant,
        'color': Colors.green,
      },
      {
        'title': 'Life Stages',
        'description': 'Discover how to care for your dog through different life stages, from puppy to senior.',
        'icon': Icons.timeline,
        'color': Colors.orange,
      },
      {
        'title': 'Health Tips',
        'description': 'Get useful information on maintaining your dog’s overall health and wellness.',
        'icon': Icons.health_and_safety,
        'color': Colors.red,
      },
    ];

    return Scaffold(
      backgroundColor: Color(0xFFE8F6FF),
      appBar: AppBar(
        title: const Text('Educational Content'),

        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: category['color'],
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Icon(category['icon'], size: 40, color: Colors.white),
              title: Text(
                category['title'],
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              subtitle: Text(
                category['description'],
                style: const TextStyle(color: Colors.white70),
              ),
              onTap: () {
                // Navigate to respective category content page
                // e.g. Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryPage()));
              },
            ),
          );
        },
      ),
    );
  }
}
