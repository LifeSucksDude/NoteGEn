import 'package:flutter/material.dart';

import '../constants/assetsImage.dart';
import '../constants/themeDark.dart';
import '../utilities/gradButton.dart';
import '../utilities/gradienttext.dart';


class MainOnBoardingScreen extends StatelessWidget {
  const MainOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 100 / 932,
            ),
            GradientText(
              "NoteGenie",
              gradient: DarkTheme.geneieGradient,
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: screenHeight * 75 / 932,
            ),
            Container(
              height: screenHeight * 310 / 932,
              width: screenWidth * 310 / 430,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetImages.welcomeImage))),
            ),
            SizedBox(
              height: screenHeight * 50 / 932,
            ),
            Text(
              "Hi user!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: screenHeight * 20 / 932,
            ),
            Text(
              "We are a smart note solution",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: screenHeight * 40 / screenWidth,
            ),
            GradButton(
              text: "Sign Up",
              onTap: () {
                
              },
            ),
            SizedBox(
              height: screenHeight * 30 / 932,
            ),
            GestureDetector(
                onTap: () {

                },
                child: GradientText(
                  "Sign in",
                  gradient: DarkTheme.geneieGradient,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ),
    );
  }
}
