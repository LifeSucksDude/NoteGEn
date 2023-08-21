import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notegenierecreated/Widgets/musicplayerforcard.dart';
import 'package:notegenierecreated/constants/themeDark.dart';

import '../constants/assetsImage.dart';

class AtomicNoteCard extends StatelessWidget {
  final bool isStarred;
  final bool hasCheck;
  final String noteTitle;
  final String localAudPath;
  final String transcribedText;
  final String cardId;
   
  // List<String> imagePaths=["assets/images/card1.png","assets/images/card2.png","assets/images/card3.png","assets/images/card4.png","assets/images/card5.png"];
  // List<Color> dateTimeCol=[Color.fromARGB(255, 164, 148, 255),Color.fromARGB(255, 255, 147, 147),Color.fromARGB(255, 201, 201, 201,),Color.fromARGB(255, 146, 176, 255),Color.fromARGB(255, 255, 201, 147)];
  final String date;
 
  const AtomicNoteCard({super.key, required this.isStarred, required this.hasCheck, required this.noteTitle, required this.localAudPath, required this.transcribedText, required this.date,  required this.cardId});

  @override
  Widget build(BuildContext context) {
    
    
   DateTime formattedDate= DateTime.parse(date); //convert the string to the datetime type
   String formattedDateInString=DateFormat("MMMM dd, yyyy").format(formattedDate);
   String digitsOnly = DateFormat("yyyyMMddHHmmss").format(formattedDate);
   int digits=int.tryParse(digitsOnly)??0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Stack(
        children: [
          
          SizedBox(
            height: 8+180,
            width: 358,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
               
                 Container(
                            height:4+180,
                            width: 358,
                            decoration:const BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                              gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 178, 163, 255),
                      Color.fromARGB(255, 243, 163, 255),
                      Color.fromARGB(255, 255, 228, 163)
                    ])
                            ),
                          ),
                Container(
                  height: 180,
                  width: 358,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(colors: [Color.fromARGB(255, 252, 252, 252,),Color.fromARGB(255, 247, 247, 247,)],begin: Alignment.topCenter,end: Alignment.bottomCenter)
                   
                   // image: DecorationImage(image: AssetImage('some image to be inserted later'))
                  ),
                  child: Column(
                    children: [
                     
                        
                           
                          Padding(
                            padding: const EdgeInsets.only(left:16.0,right: 16,top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('$noteTitle',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: DarkTheme.textCol),),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(image: AssetImage(AssetImages.goldenStar))
                                        ),
                                      ),
                                    ),
                               const SizedBox(width: 8,),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration:const BoxDecoration(
                                    image: DecorationImage(image: AssetImage(AssetImages.blueunion))
                                  ),
                                ),
                               
                                  ],
                                ),
                              
              
                              ],
                            ),
                          ),
                       const   SizedBox(height: 12,),
                          CardMusicPlayer(
                            digits: digits,
                            audioPath: localAudPath,
                          ),
                         const  SizedBox(height: 12,),
                          Container(
                            height: 32,
                            width: 335,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(transcribedText,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w100,overflow: TextOverflow.ellipsis,),maxLines: 2,)),
                          ),
                    Padding(
                          padding: const EdgeInsets.only(left:16.0,right: 16,top: 12,bottom: 12),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 16,
                              width: 82,
                              child: 
                               
                               Text(formattedDateInString,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 201, 201, 201),),)),
                          ),
                    ),
                        
                      
                   
                        ],
                      ),
                      
              
                    
                  ),
                  
                
              ],
            ),
          ),
           
            
              Align(
                    alignment: Alignment.topRight,
                     child: Container(
                                    height: 18,
                                    width: 18,
                                    decoration: BoxDecoration(
                                      color: DarkTheme.red,
                                      borderRadius: BorderRadius.circular(16)
                                    ),
                                    child: Center(child: Text("1",style: TextStyle(fontSize: 10,fontFamily: "Satoshi",color: DarkTheme.bgcol),)),
                                  ),
                   ),
            
        ],
      ),
    );
  }
}