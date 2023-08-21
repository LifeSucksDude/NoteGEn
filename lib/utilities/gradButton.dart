// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constants/themeDark.dart';



// ignore: must_be_immutable
class GradButton extends StatelessWidget {
  String text;
 final VoidCallback onTap;
  GradButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
         
            gradient: DarkTheme.geneieGradient
          ),
        
        height: 56*screenHeight/932,
        width: 336*screenWidth/430,
        child: Center(child: Text(text,style:TextStyle(fontSize: 16,color: DarkTheme.whiteCol,fontFamily: "Satoshi",fontWeight: FontWeight.w700) ,)),
      ),
    );
  }
}
