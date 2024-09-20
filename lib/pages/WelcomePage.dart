import 'package:dog_nutrition_app/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SignupPage extends StatelessWidget {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                children: [
                  // Page 1
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30), // Top padding
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Text(
                          "Meet your",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Text(
                          "dogs needs",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Text(
                          "here",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                          ),
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images_ui/signup_page_img.png',
                          width: 250,
                          height: 250,
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          "Get interesting promos here, register your",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF898989),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          "account immediately so you can meet your",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF898989),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          "animal needs.",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF898989),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),

                  // Page 2
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Text(
                          "Track your",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Text(
                          "dog’s health",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Text(
                          "progress",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                          ),
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images_ui/health_tracking_img.png',
                          width: 250,
                          height: 250,
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          "Monitor your pet’s health, activity, and",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF898989),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          "nutrition to ensure their well-being.",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF898989),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),

                  // Page 3
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Text(
                          "Discover our",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Text(
                          "community",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Text(
                          "now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                          ),
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images_ui/community_img.png',
                          width: 250,
                          height: 250,
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          "Discover new education futures for the",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF898989),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          "more knowledgement about your dog",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF898989),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // SmoothPageIndicator
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 8.0,
                  radius: 30.0,
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 0.5,
                  dotColor: Colors.grey,
                  activeDotColor: Color(0xFF0077B6),
                ),
              ),
            ),
            SizedBox(height: 40), // Spacing between indicator and button
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GetStartedPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0077B6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.36),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}