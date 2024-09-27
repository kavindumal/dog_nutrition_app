import 'package:dog_nutrition_app/pages/dashboard/pages/CartPage.dart';
import 'package:dog_nutrition_app/pages/dashboard/pages/DryFoodPage.dart';
import 'package:dog_nutrition_app/pages/dashboard/pages/SupplementsPage.dart';
import 'package:dog_nutrition_app/pages/dashboard/pages/ToysPage.dart';
import 'package:dog_nutrition_app/pages/dashboard/pages/WetFoodPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F6FF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage())
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPromotionsCarousel(),
          const SizedBox(height: 16),
          _buildCategoriesSection(context), // Passing context here
          const SizedBox(height: 16),
          _buildTopProductsSection(),
        ],
      ),
    );
  }

  // Promotion carousel
  Widget _buildPromotionsCarousel() {
    return SizedBox(
      height: 180,
      child: PageView(
        children: [
          _buildPromotionCard('assets/images_ui/promo1.png', 'Special Discount on Dry Food'),
          _buildPromotionCard('assets/images_ui/promo2.png', 'Buy 1 Get 1 Free on Wet Food'),
          _buildPromotionCard('assets/images_ui/promo3.png', '20% Off Supplements'),
        ],
      ),
    );
  }

  Widget _buildPromotionCard(String imagePath, String promoText) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                promoText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Categories section
  Widget _buildCategoriesSection(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'title': 'Dry Food', 'icon': 'assets/images_ui/dry_food.png'},
      {'title': 'Wet Food', 'icon': 'assets/images_ui/wet_food.png'},
      {'title': 'Supplements', 'icon': 'assets/images_ui/supplements.png'},
      {'title': 'Toys', 'icon': 'assets/images_ui/toys.png'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return _buildCategoryCard(
              categories[index]['title']!,
              categories[index]['icon']!,
              context, // Passing context here
            );
          },
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String title, String iconPath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToCategoryPage(context, title); // Use context here
      },
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToCategoryPage(BuildContext context, String category) {
    Widget page = const DryFoodPage(); // Default page

    if (category == 'Dry Food') {
      page = const DryFoodPage();
    } else if (category == 'Wet Food') {
      page = const Wetfoodpage(); // Change this to WetFoodPage when created
    } else if (category == 'Supplements') {
      page = const Supplementspage(); // Change this to SupplementsPage when created
    } else if (category == 'Toys') {
      page = const Toyspage(); // Change this to ToysPage when created
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Widget _buildTopProductsSection() {
    final List<Map<String, String>> topProducts = [
      {'name': 'Premium Dry Food', 'price': '\$25', 'image': 'assets/images_ui/dry_food_product.png'},
      {'name': 'Organic Wet Food', 'price': '\$15', 'image': 'assets/images_ui/wet_food_product.png'},
      {'name': 'Multivitamin Supplements', 'price': '\$30', 'image': 'assets/images_ui/supplement_product.png'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Products',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Column(
          children: topProducts.map((product) {
            return _buildProductCard(
              product['name']!,
              product['price']!,
              product['image']!,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildProductCard(String name, String price, String imagePath) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 50,
            width: 50,
          ),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(price),
        trailing: const Icon(Icons.add_shopping_cart, color: Colors.blue),
        onTap: () {
          // Add to cart functionality
        },
      ),
    );
  }
}
