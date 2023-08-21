import 'package:flutter/material.dart';

import '../constants/assetsImage.dart';
import '../constants/themeDark.dart';

class MyCreateView extends StatefulWidget {
  const MyCreateView({super.key});

  @override
  State<MyCreateView> createState() => _MyCreateViewState();
}

class _MyCreateViewState extends State<MyCreateView> {
  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
     final screenWidth=MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: DarkTheme.bgcol,
        borderRadius: BorderRadius.circular(20*screenWidth/430)
      ),
      height: 317,
      width: screenWidth,
      child: Column(
        children: [
           SizedBox(height: 16*screenHeight/932,),
                Container(
                  height: 4*screenHeight/932,
                  width: 42*screenHeight/932,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4*screenHeight/932)),
                    color: Color.fromARGB(255, 213, 213, 213)
                  ),
                ),
                SizedBox(height: 40,),
                Text("Create",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: DarkTheme.textCol,fontFamily: "Nunito"),),
                 SizedBox(height: 40,),
                  Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
          children: [
          Column(
            children: [
              GestureDetector(
                onTap: (){
                
                },
                child: Container(
                  height: 88*screenHeight/932,
                  width: 88*screenHeight/932,
                  decoration: BoxDecoration(
                    color: DarkTheme.purple,
                    borderRadius: BorderRadius.all(Radius.circular(22*screenHeight/932))
                  ),
                  child: SizedBox(
                    height: 32*screenHeight/932,
                    width: 32*screenWidth/932,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Container(
                        decoration: BoxDecoration(
                          
                          image: DecorationImage(image: AssetImage(AssetImages.whitePen))
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14*screenHeight/932,),
              Row(
                children: [
                  Text("*Genie Note",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500,color: DarkTheme.purple),),
                  Padding(
                    padding: const EdgeInsets.only(left:4.0),
                    child: Container(height: 12,
                    width: 12,
                    child: Image(image: AssetImage(AssetImages.infoIcon)),),
                  )
                ],
              )
            ],
          ),
       
           Column(
            children: [
              GestureDetector(
                onTap: () {
                 
                },
                child: Container(
                  height: 88*screenHeight/932,
                  width: 88*screenHeight/932,
                  decoration: BoxDecoration(
                    color: DarkTheme.prblue,
                    borderRadius: BorderRadius.all(Radius.circular(70*screenHeight/932))
                  ),
                  child: SizedBox(
                    height: 32*screenHeight/932,
                    width: 32*screenWidth/932,
                    child: Container(
                      margin: EdgeInsets.all(23),
                       height: 32*screenHeight/932,
                    width: 32*screenWidth/932,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(AssetImages.whiteAtomic,),fit: BoxFit.fitWidth)
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14*screenHeight/932,),
              Row(
                children: [
                  Text("Atomic Goals",style: TextStyle(fontSize:14,color: DarkTheme.prblue),),
                   Padding(
                    padding: const EdgeInsets.only(left:4.0),
                    child: Container(height: 12,
                    width: 12,
                    child: const Image(image: AssetImage(AssetImages.infoIcon)),),
                  )
                ],
              )
            ],
          )
        ],)
        ],
      ),
    );
  }
}