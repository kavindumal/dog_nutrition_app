import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F6FF),
      appBar: AppBar(
        title: const Text(
          'Shop',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              // Navigate to cart
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPromotionsCarousel(),
          const SizedBox(height: 16),
          _buildCategoriesSection(),
          const SizedBox(height: 16),
          _buildTopProductsSection(),
        ],
      ),
    );
  }

  // Promotion carousel
  Widget _buildPromotionsCarousel() {
    return Container(
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
                style: TextStyle(
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
  Widget _buildCategoriesSection() {
    final List<Map<String, String>> categories = [
      {'title': 'Dry Food', 'icon': 'assets/images_ui/dry_food.png'},
      {'title': 'Wet Food', 'icon': 'assets/images_ui/wet_food.png'},
      {'title': 'Supplements', 'icon': 'assets/images_ui/supplements.png'},
      {'title': 'Toys', 'icon': 'assets/images_ui/toys.png'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return _buildCategoryCard(
              categories[index]['title']!,
              categories[index]['icon']!,
            );
          },
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String title, String iconPath) {
    return Card(
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
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Top products section
  Widget _buildTopProductsSection() {
    final List<Map<String, String>> topProducts = [
      {'name': 'Premium Dry Food', 'price': '\$25', 'image': 'assets/images_ui/dry_food_product.png'},
      {'name': 'Organic Wet Food', 'price': '\$15', 'image': 'assets/images_ui/wet_food_product.png'},
      {'name': 'Multivitamin Supplements', 'price': '\$30', 'image': 'assets/images_ui/supplement_product.png'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
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
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(price),
        trailing: Icon(Icons.add_shopping_cart, color: Colors.blue),
        onTap: () {
          // Add to cart functionality
        },
      ),
    );
  }
}
