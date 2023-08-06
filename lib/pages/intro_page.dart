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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25.0),

            // shop name
            Text(
              "SUSHI MAN",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28.0,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25.0),
    
            // icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/takoyaki.png'),
            ),

            const SizedBox(height: 25.0),

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

            const SizedBox(height: 25.0),

            // get started button
            MyButton(
              text: "Get Started",
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}