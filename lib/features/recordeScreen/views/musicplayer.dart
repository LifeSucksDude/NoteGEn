import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notegenierecreated/Widgets/musicplayerforcard.dart';
import 'package:notegenierecreated/animations/musicplayanima.dart';
import 'package:notegenierecreated/constants/assetsImage.dart';
import 'package:notegenierecreated/features/recordeScreen/views/recorder.dart';

import '../../../constants/themeDark.dart';

final PlayingProvider=StateProvider((ref) {
  return false;
});


class MyMusicPlayer extends ConsumerStatefulWidget {
  const MyMusicPlayer({super.key});

  @override
  ConsumerState<MyMusicPlayer> createState() => _MyMusicPlayerState();
}

class _MyMusicPlayerState extends ConsumerState<MyMusicPlayer> {
  late AudioPlayer audioPlayer;
  @override
  void initState() {
    audioPlayer=AudioPlayer();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
     audioPlayer.dispose();
    
    super.dispose();
  }
  @override
 
  
  Widget build(BuildContext context) {
    print(ref.watch(RecordPathProvider));
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                          height: 100,
                          width: 330,
                          decoration: BoxDecoration(
                            color: DarkTheme.sheetRecordColor.withOpacity(0.11),
                            borderRadius: BorderRadius.all(Radius.circular(24))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20,bottom: 20),
                            child: PlayBarsVisualizer(isPlaying: ref.watch(PlayingProvider)),
                          ),
                         ),
                         Center(
                           child: Container(
                            width: 330,
                             child: Divider(
                height: 0.5,
              ),
                           ),
                         )
            ],
          ),
         
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             CardMusicPlayer(audioPath:ref.watch(RecordPathProvider) )
             

            ],
          ),
          
        ],
      ),
    );
  }
}