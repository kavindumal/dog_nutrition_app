import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'EducationPage.dart';
import 'HomePage.dart';
import 'MePage.dart';
import 'ShopPage.dart';
import 'CartPage.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> with TickerProviderStateMixin {
  int _bottomNavIndex = 0;

  final List<IconData> iconList = [
    Icons.home,
    Icons.shop,
    Icons.cast_for_education,
    Icons.settings,
  ];

  final List<String> iconPaths = [
    'assets/icon/home-black.png',
    'assets/icon/shop-black.png',
    'assets/icon/education-black-icon.png',
    'assets/icon/me-black.png',
  ];

  final List<String> activeIconPaths = [
    'assets/icon/home-colored.png',
    'assets/icon/shop-colored.png',
    'assets/icon/education-colored-icon.png',
    'assets/icon/me-colored.png',
  ];

  final List<String> labels = [
    "Home",
    "Shop",
    "Education",
    "Me"
  ];

  late AnimationController _fabAnimationController;
  late Animation<double> fabAnimation;
  late CurvedAnimation fabCurve;

  @override
  void initState() {
    super.initState();

    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Curves.fastOutSlowIn,
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);

    Future.delayed(
      const Duration(seconds: 1),
          () => _fabAnimationController.forward(),
    );
  }

  @override
  void dispose() {
    _fabAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F6FF),
      body: _getBody(_bottomNavIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _handleCartIconTap(context);
        },
        backgroundColor: const Color(0xFF047BCE),
        shape: const CircleBorder(),
        child: Image.asset(
          'assets/icon/cart-icon.png',
          width: 30,
          height: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final iconPath = isActive ? activeIconPaths[index] : iconPaths[index];
          final color = isActive ? const Color(0xFF047BCE) : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                iconPath,
                width: 24,
                height: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Text(
                labels[index],
                style: TextStyle(color: color, fontSize: 12),
              ),
            ],
          );
        },
        backgroundColor: Colors.white,
        activeIndex: _bottomNavIndex,
        splashColor: const Color(0xFF047BCE),
        notchAndCornersAnimation: fabAnimation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.softEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const ShopPage();
      case 2:
        return const EducationPage();
      case 3:
        return const MePage();
      default:
        return const HomePage();
    }
  }

  void _handleCartIconTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CartPage(),
      ),
    );
  }
}
