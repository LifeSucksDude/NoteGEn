// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:notegenierecreated/constants/themeDark.dart';

class NotifyListCard extends StatelessWidget {
 final String todoGoal;
 final String goalTitle;
 final String dateTime;
 final String dateitdown;
  

 const NotifyListCard({
    Key? key,
    required this.todoGoal,
    required this.goalTitle, required this.dateTime, required this.dateitdown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     DateTime formattedDate= DateTime.parse(dateTime); //convert the string to the datetime type
   String formattedDateInString=DateFormat("MMMM dd, yyyy").format(formattedDate);
   DateTime dateTimeforit=DateTime.parse(dateitdown);
   DateTime now = DateTime.now();
   Duration duration = now.difference(dateTimeforit);
   int hoursDiff=duration.inHours;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 80,

       
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(height: 15,),
                Container(
                  height: 5.67,
                  width: 5.67,
                  decoration:const BoxDecoration(
                    color: DarkTheme.pupleCol,
                    borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                ),
              ],
            ),
            SizedBox(width: 21.67,),
          
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                 
                 Container(
                              height:62+10,
                              width: 330,
                              decoration:const BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12),bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                                gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 178, 163, 255),
                        Color.fromARGB(255, 243, 163, 255),
                        Color.fromARGB(255, 255, 228, 163)
                      ])
                              ),
                            ),
                   
                  Container(
                    height: 70,
                    width: 330,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color:Color.fromARGB(255, 249, 249, 249)
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 150,
                                child: Text(goalTitle,style: TextStyle(fontSize: 12,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.w700,fontFamily: "Satoshi"),),
                              ),
                               Container(
                               
                                child: Text(formattedDateInString,style: TextStyle(fontSize: 10,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.w200,color: Color.fromARGB(255, 41, 41, 41),),),
                              )
                            ],
                          ),
                        ),
                       SizedBox(height: 12.0,),
                      
                        
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                                 Padding(
                             padding: const EdgeInsets.only(left:8.0,top: 4.0),
                             child: Container(
                              alignment: Alignment.centerLeft,
                              height: 12,
                              width: 200,
                              child: Text(todoGoal,style: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.w300,overflow: TextOverflow.ellipsis),),
                              
                                                     
                                                   ),
                           ),
                               Padding(
                                 padding: const EdgeInsets.only(left:8.0,top: 4.0,right: 8.0),
                                 child: Container(
                                  width: 100,
                                  alignment: Alignment.centerRight,
                                  
                                  child: Text(hoursDiff<0?"${hoursDiff} ago":"${hoursDiff} hours to go",style: TextStyle(fontSize: 10,color: Color.fromARGB(255, 41, 41, 41),fontWeight: FontWeight.w200),),
                                  
                                                         
                                                       ),
                               ),
                             ],
                           )
                        
                      ],
                    ),
                  ),
                ],
              ),
            
          ],
    
        ),
      ),
    );
  }
}
