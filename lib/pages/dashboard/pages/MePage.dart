import 'package:flutter/material.dart';

import 'EditMePage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFE8F6FF),
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
            Text(
              'User Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Name'),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.blue),
              title: Text('johndoe@example.com', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Email'),
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
            Text(
              'Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.home, color: Colors.blue),
              title: Text('123 Main Street, Apt 4B', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Home Address'),
            ),
            ListTile(
              leading: Icon(Icons.location_city, color: Colors.blue),
              title: Text('New York, NY 10001', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('City & Postal Code'),
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
            Text(
              'Payment Methods',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.credit_card, color: Colors.blue),
              title: Text('Visa •••• 4242', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Default Payment Method'),
            ),
            ListTile(
              leading: Icon(Icons.paypal, color: Colors.blue),
              title: Text('PayPal johndoe@example.com', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Linked PayPal Account'),
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
          icon: Icon(Icons.edit, color: Colors.black),
          label: Text('Edit Profile'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // Update Information logic
          },
          icon: Icon(Icons.update, color: Colors.white),
          label: Text(
            'Update Info',
            style: TextStyle(color: Colors.white), // Set label color to white
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
