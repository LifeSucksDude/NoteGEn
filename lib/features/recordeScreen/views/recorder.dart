import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notegenierecreated/features/recordeScreen/repository/whisperapi.dart';

import 'package:notegenierecreated/features/recordeScreen/views/musicplayer.dart';
import 'package:notegenierecreated/utilities/showbottsheet.dart';
import 'package:notegenierecreated/widgetforapp/createNote.dart';
import 'package:record/record.dart';

import '../../../animations/musicplayanima.dart';
import '../../../animations/recordinganimations.dart';
import '../../../constants/themeDark.dart';
import '../../../widgetforapp/createNote.dart';
import '../../../widgetforapp/playpause.dart';
final isClickedProvider=StateProvider((ref)=>false
);
final RecordPathProvider=StateProvider<String>((ref) {
  return '';
});

class RecorderWidget
 extends ConsumerStatefulWidget {
  const RecorderWidget
  ({super.key});

  @override
  ConsumerState<RecorderWidget> createState() => _RecorderWidgetState();
}

class _RecorderWidgetState extends ConsumerState<RecorderWidget> {
  late Record audiorecord;
  late AudioPlayer audioPlayer;
   DateTime? startTime;
  Timer? timer;
  String duration = '00:00';
  
 
  @override
  void initState() {
    audioPlayer=AudioPlayer();
    audiorecord=Record();
    super.initState();
  }
   @override
  void dispose() {
    audioPlayer.dispose();
    audiorecord.dispose();
    super.dispose();
  }
  Future<void> startRecording()async{
    try{
      if(await audiorecord.hasPermission()){
     
        debugPrint("Yeah starting recoding finally");
       await audiorecord.start();
         ref.read(isClickedProvider.notifier).update((state) => true);
         startTimer();
         ref.read(RecordPathProvider.notifier).update((state) => '');
      }
    }
    catch(e){
      debugPrint(e.toString());
    }
  }
   Future<void> stopRecording()async{
    try{
     String? path=await audiorecord.stop();
      ref.read(isClickedProvider.notifier).update((state) => false);
      stopTimer();
     ref.read(RecordPathProvider.notifier).update((state) => path!);
     debugPrint(path);

    }
    catch(e){
      debugPrint(e.toString());
    }
  }
  void startTimer() {
    setState(() {
      startTime = DateTime.now();
      duration = '00:00';
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (startTime != null) {
          Duration timeDifference = DateTime.now().difference(startTime!);
          int seconds = timeDifference.inSeconds;
          int minutes = seconds ~/ 60;
          seconds %= 60;
          setState(() {
            duration = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
          });
        }
      });
    });
  }
  void stopTimer() {
    setState(() {
      startTime = null;
      duration = '00:00';
      timer?.cancel();
    });
  }
  @override
  Widget build(BuildContext context) {
    print(ref.watch(RecordPathProvider));
    bool isclicked=ref.watch(isClickedProvider);
    
    
 final screenHeight=MediaQuery.of(context).size.height;
           final screenWidth=MediaQuery.of(context).size.width;
    return Container(
            height: screenHeight/2,
            width: screenWidth,
            decoration: BoxDecoration(
              
             color: Colors.white,
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
                 
                  child: Center(child: Text("Enter Title",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),))),
                  SizedBox(height: 24,),
                  Visibility(
                    visible: ref.watch(RecordPathProvider)=='',
                    child: Column(
                      children: [
                        Text(isclicked?"*Rec":"*Paused",style: TextStyle(color: DarkTheme.pupleCol,fontWeight: FontWeight.w400,fontSize: 14),),
                          SizedBox(height: 16,),
                      ],
                    )),
               
                 
                   
                 Visibility(
                   visible:   ref.watch(RecordPathProvider)=='',
                   child: Container(
                          height: 142,
                          width: 394*screenWidth/430,
                          decoration: BoxDecoration(
                            color: DarkTheme.sheetRecordColor.withOpacity(0.11),
                            borderRadius: BorderRadius.all(Radius.circular(24))
                          ),
                          child: Visibility(
                            visible: isclicked,
                            child: BarsVisualizer()),
                         ),
                 ),
                  Visibility(
                   visible:  ref.watch(RecordPathProvider)=='',
                   child: Container(
                         
                        
                          decoration: BoxDecoration(
                            color: DarkTheme.sheetRecordColor.withOpacity(0.11),
                            borderRadius: BorderRadius.all(Radius.circular(24))
                          ),
                          child: Visibility(
                            visible: ref.watch(RecordPathProvider)!='',
                            child: MyMusicPlayer()),
                         ),
                 ),
                 Visibility(
                  visible: isclicked && ref.watch(RecordPathProvider)=='',
                  child: Text("$duration",style: TextStyle(color: DarkTheme.pupleCol,fontSize: 24,fontWeight: FontWeight.w600),)),


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
                                 //  convertSpeechToText(ref.watch(RecordPathProvider));
                                    Navigator.pop(context);
                                 ShowBottomSheetView(context, MyCreateView(), ref);
                              
                                  },
                                  child: Padding(
                                    padding:  const EdgeInsets.only(right:30.0),
                                    child: Text("Next",style: TextStyle(color: DarkTheme.skBlue,fontSize: 18,fontWeight: FontWeight.w500),),
                                  ),
                                )
                              ],
                            ),
                  ),
          SizedBox(height: 20,),
                    Divider(
                height: 0.5,
              ),
            Expanded(child: SizedBox()),
              SizedBox(height: screenHeight*10/932,),
             
                  GestureDetector(
                    onTap: ()async{
                      if(!isclicked){
                        

                     await  startRecording();
                      startTimer();
                      }
                      else{
                        stopRecording();
                        stopTimer();
                      }
                     
                        ref.watch(isClickedProvider.notifier).update((state) => !isclicked);
                         
                        ref.read(RecordPathProvider.notifier).update((state) => '');
                        ref.read(PlayingProvider.notifier).update((state) => false);
                        
                    },
                    child: PlayPause()),
                  SizedBox(height: 20,),



              ],
            ),
          );
  }
  }
