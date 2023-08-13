import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/button.dart';
import '../theme/colors.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Positioned(
            right: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: Image.asset(
              'lib/images/intro_page_bg.png',
              height: 3111,
              width: 4317,
              fit: BoxFit.contain,
            ),
          ),

          // background image
          Positioned(
            right: 30.0,
            top: 0.0,
            bottom: 150.0,
            child: Image.asset(
              'lib/images/intro_page_chopsticks.png',
              height: 400.0,
              width: 400.0,
              fit: BoxFit.scaleDown,
            ),
          ),

          // content
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 0.0),
              child: Text(
                "SUSHIMAN",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0, right: 25.0, left: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // title
                  Text(
                    "THE TASTE OF JAPANESE FOOD",
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 44.0,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 10.0),

                  // subtitle
                  Text(
                    "Feel the taste of the most delicious Japanese food in town, from anywhere and anytime",
                    style: TextStyle(
                      color: Colors.grey[300],
                      height: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 25.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: MyButton(
                text: "Get Started",
                onTap: () {
                  Navigator.pushNamed(context, '/menupage');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}