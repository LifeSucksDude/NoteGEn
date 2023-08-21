import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notegenierecreated/constants/assetsImage.dart';
import 'package:notegenierecreated/constants/themeDark.dart';
import 'package:notegenierecreated/features/recordeScreen/views/musicplayer.dart';
import 'package:notegenierecreated/features/recordeScreen/views/recorder.dart';
import 'package:notegenierecreated/utilities/morefilepick.dart';
import 'package:notegenierecreated/utilities/showbottsheet.dart';
import 'package:notegenierecreated/widgetforapp/createNote.dart';
import 'package:notegenierecreated/widgetforapp/playpause.dart';

import '../features/recordeScreen/repository/whisperapi.dart';

/*class BottomSheetType{
  onImportAskedDrawer(context){
    showBottomSheet(context:  context, builder: (context){
    String? audioFile;
         TextEditingController mySubject=TextEditingController();
          final screenHeight=MediaQuery.of(context).size.height;
           final screenWidth=MediaQuery.of(context).size.height;
          return Container(
            height: screenHeight/2,
            width: screenWidth,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 219, 219, 219)
              ),
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(40)
            ),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                SizedBox(height: 10*screenHeight/430,),
                Container(
                  width: screenWidth-10*screenWidth/432,
                 
                  child: Center(child: Text("Enter The Title",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),))),
                  SizedBox(height: 70,),
                  GestureDetector(
                    onTap: ()async{
                       audioFile=await pickAudioFile(context);
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: DarkTheme.greyBoxCol,
                      ),
                      child: Image.asset(AssetImages.importIcon),
                    ),
                  ),
                   Expanded(child: SizedBox()),
                    Divider(
                height: 0.5,
              ),
              SizedBox(height: screenHeight*10/932,),
                  PlayPause(isClicked: false),
                  SizedBox(height: 30,),



              ],
            ),
          );
    });
  }
 onRecordDrawer(context){
    showBottomSheet(context: context, builder: (context){
      return Container(
        child: Center(
          child: Text("Record Audio"),
        ),
      );
    });
  }
}*/


// ignore: must_be_immutable
class MyBottomSheet extends ConsumerWidget {
  MyBottomSheet({super.key});
   String? audioFile;
         TextEditingController mySubject=TextEditingController();
         
   
  @override
  Widget build(BuildContext context,WidgetRef ref) {
  
 final screenHeight=MediaQuery.of(context).size.height;
           final screenWidth=MediaQuery.of(context).size.height;
    return Container(
            height: screenHeight/2,
            width: screenWidth,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 219, 219, 219)
              ),
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(40)
            ),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                SizedBox(height: 10*screenHeight/430,),
                Container(
                  width: screenWidth-10*screenWidth/432,
                 
                  child: Center(child: Text("Enter The Title",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),))),
                  SizedBox(height: 70,),
                ref.watch(RecordPathProvider)==''?    GestureDetector(
                    onTap: ()async{
                       ref.read(PlayingProvider.notifier).update((state) => false);
                       audioFile=await pickAudioFile(context);
                       ref.read(RecordPathProvider.notifier).update((state) => audioFile!);
                    },
                    child: 
                  
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: DarkTheme.greyBoxCol,
                      ),
                      child: Image.asset(AssetImages.importIcon),
                    )
                  ):MyMusicPlayer(),
                     SizedBox(height: 20,),
                      SizedBox(height: 10,),
                  Visibility(
                    visible: ref.watch(RecordPathProvider)!='',
                    child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    ref.read(RecordPathProvider.notifier).update((state) => '');

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:30.0),
                                    child: Text("Cancel",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.w500),),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                   ShowBottomSheetView(context, MyCreateView(), ref);
                                   //convertSpeechToText(ref.watch(RecordPathProvider));
                                  },
                                  child: Padding(
                                    padding:  const EdgeInsets.only(right:30.0),
                                    child: Text("Next",style: TextStyle(color: DarkTheme.skBlue,fontSize: 18,fontWeight: FontWeight.w500),),
                                  ),
                                )
                              ],
                            ),
                  ),
                   Expanded(child: SizedBox()),
                    Divider(
                height: 0.5,
              ),
              SizedBox(height: screenHeight*10/932,),
               
                  SizedBox(height: 80,),



              ],
            ),
          );
  }
}