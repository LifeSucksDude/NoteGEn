import 'package:flutter/material.dart';
import 'package:notegenierecreated/constants/themeDark.dart';

void showSnackBar({required BuildContext context,required String content}){
 ScaffoldMessenger.of(context).showSnackBar(
  
  SnackBar(content: Text(content,style: TextStyle(color: DarkTheme.bgcol),),backgroundColor: DarkTheme.textCol,)
 );
}