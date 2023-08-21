import 'package:flutter/material.dart';
import 'package:notegenierecreated/constants/assetsImage.dart';
import 'package:notegenierecreated/constants/themeDark.dart';
import 'package:notegenierecreated/features/notificationspage/card/notifycard.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.bgcol,
      body: SafeArea(child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           const SizedBox(width: 16,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: SizedBox(
                height: 30,
                width: 30,
               child: Icon(Icons.navigate_before_sharp,size: 30,color: DarkTheme.textCol,),
              ),
            ),
            SizedBox(width: 89,),
          const Text("Notification",style: TextStyle(color: DarkTheme.textCol,fontSize: 22,fontFamily: "Nunito"),)
          ],
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
        SizedBox(height: 218),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           
            children: [
              Container(
                height: 140,
                width: 140,
                child: Image.asset(AssetImages.notifyimg),
              ),
              SizedBox(height: 24,),
              Text("you have no new notifications;",style: TextStyle(color: Color.fromARGB(255, 213, 213, 213),fontFamily: "Satoshi",fontWeight: FontWeight.w500,),),
              NotifyListCard(
                todoGoal: "Wash the clothes fucker! fast do it anyhow tu humesha aisa hi karta h bc chutiya prajati ka h tu",
                goalTitle: "Kapde Dhul Mc",
                dateTime: "2023-07-04 09:33:22.011484",
                dateitdown: "2023-05-04 09:33:22.011484",
                
              )
            ],
          ),
        )
      ],)),
    );
  }
}