import 'package:dog_nutrition_app/pages/CreateAccountPage.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Privacy Policy',
      theme: ThemeData(
        primaryColor: const Color(0xFF047BCE), // Theme color
      ),
      home: const PrivacyPolicyPage(),
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Image.asset('assets/images/icons/back-btn.png'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateAccountPage()),
            );
          },
        ),
        title: const Text(
          'Privacy Policy',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFFFFF),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrivacyPolicySection(
              title: '1. Information We Collect',
              content:
              'We collect information that you provide directly to us when you register, use our Services, or communicate with us. This includes:\n\n'
                  '- Personal Information: Your name, email address, phone number, and other contact information.\n'
                  '- Transaction Information: Details about deposits, withdrawals, and other transactions carried out on the platform.\n'
                  '- Usage Information: Information about how you use our Services, including your game activity, betting activity, and communication with customer support.\n\n'
                  'We do not collect sensitive personal information such as your social security number, financial information, or health information.',
            ),
            PrivacyPolicySection(
              title: '2. How We Use Your Information',
              content:
              'We use the information we collect to:\n\n'
                  '- Provide, maintain, and improve our Services.\n'
                  '- Facilitate deposits and withdrawals.\n'
                  '- Communicate with you about your account, transactions, and customer service inquiries.\n'
                  '- Detect and prevent fraud, abuse, or other harmful activity.\n'
                  '- Comply with legal obligations and enforce our Terms of Service.',
            ),
            PrivacyPolicySection(
              title: '3. How We Share Your Information',
              content:
              'We do not sell, trade, or rent your personal information to third parties. However, we may share your information in the following circumstances:\n\n'
                  '- Service Providers: We may share information with third-party service providers who perform services on our behalf, such as payment processing and customer support.\n'
                  '- Legal Compliance: We may disclose your information if required by law or in response to legal processes, such as a subpoena, court order, or government demand.\n'
                  '- Protection of Rights: We may share information when we believe it is necessary to protect our rights, your safety, or the safety of others, investigate fraud, or respond to a government request.',
            ),
            PrivacyPolicySection(
              title: '4. Security of Your Information',
              content:
              'We take the security of your information seriously and use reasonable administrative, technical, and physical safeguards to protect it from unauthorized access, loss, theft, misuse, or alteration. However, no method of transmission over the Internet or electronic storage is 100% secure, so we cannot guarantee absolute security.',
            ),
            PrivacyPolicySection(
              title: '5. Your Choices and Rights',
              content:
              'You have the right to:\n\n'
                  '- Access, update, or delete your personal information.\n'
                  '- Opt-out of receiving promotional communications from us.\n'
                  '- Request information about the personal data we hold about you.\n\n'
                  'To exercise these rights, please contact our customer support team at [contact email/phone number].',
            ),
            PrivacyPolicySection(
              title: '6. Deposits and Withdrawals',
              content:
              'Users can deposit money into their 786 Gaming accounts using a wallet address. When deposited, the money is converted into in-game coins, which can be used for betting on various games. Withdrawals can be made via bank transfer or wallet address. We do not store sensitive financial details but facilitate secure transactions through trusted third-party payment processors.',
            ),
            PrivacyPolicySection(
              title: '7. Customer Support',
              content:
              'We offer 24-hour active customer service to address any issues or concerns you may have. If you encounter any problems, you can directly contact the 786 Gaming team at [contact information]. We strive to resolve issues quickly and efficiently.',
            ),
            PrivacyPolicySection(
              title: '8. Children\'s Privacy',
              content:
              'Our Services are not intended for children under the age of 18. We do not knowingly collect personal information from children under 18. If you are a parent or guardian and believe your child has provided us with personal information, please contact us immediately.',
            ),
            PrivacyPolicySection(
              title: '9. Changes to This Privacy Policy',
              content:
              'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Effective Date" at the top of this document. You are encouraged to review this Privacy Policy periodically for any changes.',
            ),
            PrivacyPolicySection(
              title: '10. Contact Us',
              content:
              'If you have any questions or concerns about this Privacy Policy, please contact us at:\n\n'
                  '- Email: [Your contact email]\n'
                  '- Phone: [Your contact phone number]\n\n'
                  'By using our Services, you acknowledge that you have read, understood, and agreed to this Privacy Policy.',
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacyPolicySection extends StatelessWidget {
  final String title;
  final String content;

  const PrivacyPolicySection({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF047BCE), // Theme color
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            content,
            style: const TextStyle(fontSize: 16.0, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
