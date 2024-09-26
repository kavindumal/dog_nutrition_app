import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemDescriptionPage extends StatelessWidget {
  final String productName;

  const ItemDescriptionPage({super.key, required this.productName});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF0077B6),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Item Description"),
          backgroundColor: const Color(0xFF0077B6),
        ),
        body: ItemDetails(productName: productName),
      ),
    );
  }
}

class ItemDetails extends StatefulWidget {
  final String productName;

  const ItemDetails({super.key, required this.productName});

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  Map<String, dynamic>? productData;

  @override
  void initState() {
    super.initState();
    _fetchProductData(widget.productName);
  }

  Future<void> _fetchProductData(String productName) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where('name', isEqualTo: productName)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          productData = querySnapshot.docs.first.data() as Map<String, dynamic>?;
        });
      } else {
        print('No product found with the name $productName');
      }
    } catch (e) {
      print('Error fetching product data by name: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (productData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // Safely check if product fields exist
    String imageUrl = productData?['image'] ?? 'https://via.placeholder.com/300';
    String productName = productData?['name'] ?? 'Product Name';
    String productDescription = productData?['description'] ?? 'No description available.';
    double price = (productData?['price'] ?? 0.0).toDouble();
    String reviews = productData?['reviews'] ?? '0/5';
    double rating = double.tryParse(reviews.split('/')[0]) ?? 0.0;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item Photo
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Item Name
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Ratings
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20.0,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const SizedBox(width: 8),
                    Text(reviews),
                  ],
                ),
                const SizedBox(height: 16),

                // Item Price
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 16),

                // Delivery Options
                const Text(
                  'Delivery Options',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.local_shipping, color: Colors.grey[600]),
                  title: const Text('Free Delivery'),
                  subtitle: const Text('Delivered in 3-5 business days'),
                ),
                ListTile(
                  leading: Icon(Icons.location_on, color: Colors.grey[600]),
                  title: const Text('Ship to your address'),
                ),
                const SizedBox(height: 16),

                // Item Description
                const Text(
                  'Comprehensive Description',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  productDescription,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Buy Now action
                        },
                        child: const Text('Buy Now'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0077B6),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // Add to Cart action
                        },
                        child: const Text('Add to Cart'),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF0077B6)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
