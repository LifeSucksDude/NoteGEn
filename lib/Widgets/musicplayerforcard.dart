import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:notegenierecreated/animations/musiccardanimation.dart';
import 'package:notegenierecreated/constants/themeDark.dart';
import 'package:notegenierecreated/features/recordeScreen/views/musicplayer.dart';

class CardMusicPlayer extends ConsumerStatefulWidget {
  final String audioPath;
  final digits;
  List<Color> myCol = [
    Color.fromARGB(255, 248, 247, 255),
    Color.fromARGB(255, 255, 247, 247),
    Color.fromARGB(255, 248, 247, 255),
    Color.fromARGB(255, 247, 250, 255),
    Color.fromARGB(255, 255, 251, 247)
  ];
  CardMusicPlayer({super.key, required this.audioPath, this.digits});

  @override
  ConsumerState<CardMusicPlayer> createState() => _CardMusicPlayerState();
}

class _CardMusicPlayerState extends ConsumerState<CardMusicPlayer> {
  bool isselected = false;
  bool isPlaying = false;
  //Time to make the audioPlayer in the seconds of this page and use it to play the audio
  //first we are initializing the audio player class.
  AudioPlayer? audioPlayer;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {

    super.initState();
    audioPlayer = AudioPlayer();
   
    audioPlayer!.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
        ref.read(PlayingProvider.notifier).update((state) => isPlaying);
      });
    });
    audioPlayer!.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer!.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer!.dispose();
    super.dispose();
  }

  Future setAudio() async {
    audioPlayer!.setReleaseMode(ReleaseMode.loop);
    final file = File(widget.audioPath);
  }

   get newDuration => audioPlayer!.getDuration();
  

  String formatDuration(Duration durationInSeconds) {
    if (durationInSeconds.inHours > 0) {
      return '${durationInSeconds.inHours}:${(durationInSeconds.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    } else {
      return '${(durationInSeconds.inMinutes).toString().padLeft(2, '0')}:${(durationInSeconds.inSeconds % 60).toString().padLeft(2, '0')}';
    }
  }

  @override
  Widget build(BuildContext context) {
   
    print(newDuration);
    return Container(
      height: 40,
      width: 340,
      decoration: BoxDecoration(
        //  color: widget.myCol[widget.digits % 5],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: ()async{
                 if (isPlaying) {
                    await audioPlayer!.pause();
                  } else {
                    Source urlSource = UrlSource(widget.audioPath);
                    await audioPlayer!.play(urlSource);
                  }
            },
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
             
                child: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            formatDuration(position),
            style: TextStyle(
                fontSize: 14,
                color: DarkTheme.textCol,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 40,
            width: 200,
            child: SliderTheme(
              data: SliderThemeData(
                  thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 6.0,
                disabledThumbRadius: 2.0,
              )),
              child: Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  activeColor: DarkTheme.textCol,
                  inactiveColor: DarkTheme.lightTextCol,
                  onChanged: (value) async {
                    final positon = Duration(seconds: value.toInt());
                    await audioPlayer!.seek(positon);
                    setState(() {});
                  }),
            ),
          ),
          SizedBox(
            width: 0,
          ),
          Text(
            formatDuration(duration),
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: DarkTheme.textCol),
          )
        ],
      ),
    );
  }
}
