import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notegenierecreated/Widgets/differentBottom.dart';

import 'package:notegenierecreated/constants/assetsImage.dart';
import 'package:notegenierecreated/constants/themeDark.dart';
import 'package:notegenierecreated/features/recordeScreen/views/recorder.dart';
import 'package:notegenierecreated/utilities/showbottsheet.dart';

class RecORIm extends ConsumerWidget {
  const RecORIm({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Container(
    height: screenHeight/2.5,
    width:screenWidth,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )
    ),
    child: Column(
      children: [
        SizedBox(height:20*screenHeight/932 ,),
        Container(
          height: 4*screenHeight/932,
          width: 42*screenWidth/430,
          decoration: BoxDecoration(
            color: DarkTheme.rectSheet,
            borderRadius: BorderRadius.all(Radius.circular(4*screenHeight/932)),
          ),
        ),
        SizedBox(height: 35*screenHeight/932,),
        Text("New Note",style: TextStyle(color: DarkTheme.textCol,fontSize: 22,fontWeight: FontWeight.w600,fontFamily: "Nunito"),),
        SizedBox(height: 55*screenHeight/932,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
        
          children: [
          Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  ShowBottomSheetView(context, RecorderWidget(), ref);
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
                          
                          image: DecorationImage(image: AssetImage(AssetImages.recordIcon))
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14*screenHeight/932,),
              Text("*Record",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500,color: DarkTheme.purple),)
            ],
          ),
         SizedBox(width: screenWidth*44/430,),
           Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  ShowBottomSheetView(context, MyBottomSheet(),ref);
                },
                child: Container(
                  height: 88*screenHeight/932,
                  width: 88*screenHeight/932,
                  decoration: BoxDecoration(
                    color: DarkTheme.greyBoxCol,
                    borderRadius: BorderRadius.all(Radius.circular(70*screenHeight/932))
                  ),
                  child: SizedBox(
                    height: 32*screenHeight/932,
                    width: 32*screenWidth/932,
                    child: Container(
                      margin: EdgeInsets.all(22),
                       height: 32*screenHeight/932,
                    width: 32*screenWidth/932,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(AssetImages.importIcon,),fit: BoxFit.fitWidth)
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14*screenHeight/932,),
              Text("Import",style: TextStyle(fontSize:14,color: DarkTheme.lightCol),)
            ],
          )
        ],)
      ],
    ),
    );
  }
}