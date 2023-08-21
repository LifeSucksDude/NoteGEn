// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:notegenierecreated/constants/themeDark.dart';

class MusicPlayCardVisualizer extends StatefulWidget {
  final int duration;
  final Color color;
  bool isAnimaiting;
 
   MusicPlayCardVisualizer({
    Key? key,
    required this.duration,
    required this.color,
    required this.isAnimaiting,
  }) : super(key: key);

  @override
  State<MusicPlayCardVisualizer> createState() => _MusicPlayVisualizerState();
}

class _MusicPlayVisualizerState extends State<MusicPlayCardVisualizer> with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? animationController;
  @override
  void initState() {
    animationController=AnimationController(duration: Duration(milliseconds: widget.duration,),vsync: this);
    final curvedAnimation=CurvedAnimation(parent: animationController!, curve: Curves.easeInCirc);
    animation=Tween<double>(begin: 0,end:100).animate(curvedAnimation)..addListener(() {
      setState(() {
        
      });
    });
  
    if (widget.isAnimaiting) {
      animationController!.repeat(reverse: true);
    }

    // TODO: implement initState
    super.initState();
  }
  @override
  void didUpdateWidget(covariant MusicPlayCardVisualizer oldWidget) {
    if (oldWidget.isAnimaiting != widget.isAnimaiting) {
      if (widget.isAnimaiting) {
        animationController!.repeat(reverse: true);
      } else {
        animationController!.stop();
      }
    }
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
     animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:1.0),
      child: Container(
        width: 2,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(15),
        ),
        height:   animation!.value
      ),
    );
  }
}
class PlayBarsCardVisualizer extends StatelessWidget {
 List<Color> colors = List<Color>.filled(37, Colors.black);

  List<int> duration = [
    1066, 925, 1027, 1074, 1176, 800, 1129, 1121, 1184, 1051, 1192, 916, 1105,
    1152, 1058, 978, 972, 939, 962, 1068, 988, 899, 888, 898, 845, 1129, 966,
    907, 1108, 1158, 963, 963, 857, 1037, 988, 1077, 825, 917, 1105, 1211, 1186,
    1147, 872, 1082, 843, 899, 966, 1123, 1145, 1066,
  ];
  bool isPlaying;
  PlayBarsCardVisualizer({
    Key? key,
    
    required this.isPlaying,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(52, (index) =>MusicPlayCardVisualizer(duration: duration[index%37], color: colors[index%37],isAnimaiting: isPlaying,) ));
  }
}
