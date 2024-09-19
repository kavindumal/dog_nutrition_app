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
            SizedBox(height: 30), // Top padding
            Padding(
              padding: const EdgeInsets.only(left: 35.0), // Moves the text 100 pixels to the right
              child: Text(
                "Meet your",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45, // Increased font size
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35.0), // Moves the text 100 pixels to the right
              child: Text(
                "animal needs",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45, // Increased font size
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35.0), // Moves the text 100 pixels to the right
              child: Text(
                "here",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45, // Increased font size
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images_ui/signup_page_img.png',
                width: 250, // Adjust width if needed
                height: 250, // Adjust height if needed
              ),
            ),
            SizedBox(height: 20), // Spacing between image and text
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
            SizedBox(height: 40), // Spacing between text and indicator
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                axisDirection: Axis.horizontal,
                effect: WormEffect(
                  spacing: 8.0,
                  radius: 30.0,
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 0.5,
                  dotColor: Colors.grey,
                  activeDotColor: Color(0xFF0077B6), // Updated active color to #0077B6
                ),
              ),
            ),
            SizedBox(height: 40), // Spacing between indicator and button
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 80, // Button width adjustment
                height: 60, // Explicitly set button height
                child: ElevatedButton(
                  onPressed: () {
                    // Button action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0077B6), // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.36), // Button border radius
                    ),
                    padding: EdgeInsets.zero, // Remove default padding to use SizedBox height
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white, // Button text color
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
