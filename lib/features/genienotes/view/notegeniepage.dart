// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../constants/assetsImage.dart';
import '../../../constants/themeDark.dart';
final isStarredProvider=StateProvider((ref) {
  return false;
});

class GeniePage extends ConsumerWidget {
  final  String dateTime;
   bool? isStarred;
  final String genieTitle;
  final String audioPath;
  final String transcribedText;
  List<List<String>> responses;

  GeniePage({
    Key? key,
    required this.dateTime,
    required this.isStarred,
    required this.genieTitle,
    required this.audioPath,
    required this.transcribedText,
    required this.responses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    isStarred=ref.watch(isStarredProvider);
    print(isStarred);
  DateTime dateformat=DateTime.parse(dateTime);
   String formattedDateInString=DateFormat("dd/MM/yy").format(dateformat);
   String formattedtime=DateFormat("HH:mm").format(dateformat);

    return Scaffold(
      backgroundColor: DarkTheme.bgcol,
      body: SafeArea(child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const SizedBox(
                  height: 30,
                  width: 30,
                 child: Icon(Icons.navigate_before_sharp,size: 30,color: DarkTheme.textCol,),
                ),
              ),
           PopupMenuButton(
            elevation: 0,
           
           // color: Color.fromARGB(255, 255, 255, 255),
            itemBuilder: (context){
              
            
            return const [
              PopupMenuItem<int>(

                child: Center(child: Text("Save",style: TextStyle(fontSize: 14,color: DarkTheme.textCol,fontWeight: FontWeight.w500),))),
               PopupMenuItem<int>(
                child: Center(child: Text("Share",style: TextStyle(fontSize: 14,color: DarkTheme.textCol,fontWeight: FontWeight.w500),))),
               PopupMenuItem<int>(
                child: Center(child: Text("Delete",style: TextStyle(fontSize: 14,color: DarkTheme.textCol,fontWeight: FontWeight.w500),)))
            ];
           })
           
            ],
          ),
        ),
        SizedBox(height: 16,),
         Container(
          height: 2,
          decoration:const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 178, 163, 255),
            Color.fromARGB(255, 243, 163, 255),
            Color.fromARGB(255, 255, 228, 163)
          ])),
        ),
       const  SizedBox(height: 16,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    formattedtime,style: TextStyle(fontSize: 12,color: DarkTheme.lightTextCol,fontWeight: FontWeight.w400),
                  ),
                   SizedBox(width: 10,),
              Text(formattedDateInString,style: TextStyle(color: DarkTheme.lightTextCol,fontWeight: FontWeight.w400,fontSize:12),)
                ],
              ),
              GestureDetector(
                onTap: (){
                  ref.read(isStarredProvider.notifier).update((state) => !isStarred!);
                  
                  
                },
                child: Container(
                  height: 16,
                  width: 16,
                  child: !isStarred!? Image.asset(AssetImages.star):Image.asset(AssetImages.goldenStar)
                ),
              )
             
              
            ],
        
          ),
        )
      
      ],)),
    );
  }
}
