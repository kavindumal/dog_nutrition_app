import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add this for Firestore
import 'EditMePage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = '';
  String email = '';
  String address = '';
  String city = '';
  String paymentMethod = '';
  String paypalAccount = '';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  // Fetch user data from Firestore based on the logged-in user's email
  Future<void> _fetchUserData() async {
    String emailLoggedIn = "LoginPage().emailAddressLoggedIn"; // Get from LoginPage()

    try {
      // Fetch user data from Firestore
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users') // Adjust collection name to your Firestore structure
          .doc(emailLoggedIn)
          .get();

      if (userSnapshot.exists) {
        // If document exists, update the state with user data
        setState(() {
          name = userSnapshot['fullName'] ?? 'N/A';
          email = userSnapshot['email'] ?? 'N/A';
          address = userSnapshot['homeAddress'] ?? 'N/A';
          city = userSnapshot['cityPostal'] ?? 'N/A';
          paymentMethod = userSnapshot['bankCard'] ?? 'N/A';
          paypalAccount = userSnapshot['paypalEmail'] ?? 'N/A';
        });
      }
    } catch (e) {
      // Handle any errors here
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFE8F6FF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserInfoSection(),
            const SizedBox(height: 16),
            _buildAddressSection(),
            const SizedBox(height: 16),
            _buildPaymentMethodsSection(),
            const SizedBox(height: 24),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  // User Information Section
  Widget _buildUserInfoSection() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.blue),
              title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Name'),
            ),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.blue),
              title: Text(email, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Email'),
            ),
          ],
        ),
      ),
    );
  }

  // Address Section
  Widget _buildAddressSection() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: Text(address, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Home Address'),
            ),
            ListTile(
              leading: const Icon(Icons.location_city, color: Colors.blue),
              title: Text(city, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('City & Postal Code'),
            ),
          ],
        ),
      ),
    );
  }

  // Payment Methods Section
  Widget _buildPaymentMethodsSection() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Methods',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.credit_card, color: Colors.blue),
              title: Text(paymentMethod, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Default Payment Method'),
            ),
            ListTile(
              leading: const Icon(Icons.paypal, color: Colors.blue),
              title: Text(paypalAccount, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Linked PayPal Account'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditProfilePage(),
              ),
            );
          },
          icon: const Icon(Icons.edit, color: Colors.black),
          label: const Text('Edit Profile'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // Update Information logic
          },
          icon: const Icon(Icons.update, color: Colors.white),
          label: const Text(
            'Update Info',
            style: TextStyle(color: Colors.white), // Set label color to white
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
