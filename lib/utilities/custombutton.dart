import 'package:flutter/material.dart';
import 'package:notegenierecreated/constants/themeDark.dart';

class CustomButton extends StatelessWidget {

    final VoidCallback onTap;
  final String text;
 final Color textColor;
  const CustomButton({super.key,  required this.onTap, required this.text, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0),

      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            gradient: DarkTheme.geneieGradient,
            borderRadius: BorderRadius.circular(16)
          ),
          child: Center(child: Text(text,style:TextStyle(color: textColor,fontSize: 16))),
        ),
      ),
    );
  }
}