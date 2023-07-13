import 'package:flutter/material.dart';

import '../constants/assetsImage.dart';
import '../constants/themeDark.dart';
import '../utilities/gradienttext.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(1, 251, 251, 251),
            Color.fromARGB(1, 240, 240, 240)
          ],
        )),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenHeight * 108 / 932,
              width: screenWidth * 139.6 / 430,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetImages.geneiIcon))),
            ),
            SizedBox(
              height: 10,
            ),
           const GradientText(
              "NoteGenie",
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Satoshi', 
                fontWeight: FontWeight.w600// Use the assigned font family name
              ),
              gradient: DarkTheme.geneieGradient,
            )
          ],
        )),
      ),
    );
  }
}
