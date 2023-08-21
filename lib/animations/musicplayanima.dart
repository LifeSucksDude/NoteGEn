// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:notegenierecreated/constants/themeDark.dart';

class MusicPlayVisualizer extends StatefulWidget {
  final int duration;
  final Color color;
  bool isAnimaiting;
 
   MusicPlayVisualizer({
    Key? key,
    required this.duration,
    required this.color,
    required this.isAnimaiting,
  }) : super(key: key);

  @override
  State<MusicPlayVisualizer> createState() => _MusicPlayVisualizerState();
}

class _MusicPlayVisualizerState extends State<MusicPlayVisualizer> with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? animationController;
  @override
  void initState() {
    animationController=AnimationController(duration: Duration(milliseconds: widget.duration,),vsync: this);
    final curvedAnimation=CurvedAnimation(parent: animationController!, curve: Curves.bounceInOut);
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
  void didUpdateWidget(covariant MusicPlayVisualizer oldWidget) {
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
    return Container(
      width: 3,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(15),
      ),
      height:   animation!.value
    );
  }
}
class PlayBarsVisualizer extends StatelessWidget {
 List<Color> colors = [
    Color(0xFFC7A3FF), // Light Violet
    Color(0xFFC19FFF),
    Color(0xFFBC9BFF),
    Color(0xFFB696FF),
    Color(0xFFB191FF),
    Color(0xFFAC8CFF),
    Color(0xFFA687FF),
    Color(0xFFA183FF),
    Color(0xFF9B7EFF),
    Color(0xFF9579FF),
    Color(0xFF9074FF),
    Color(0xFF8B6FFF),
    Color(0xFF856AFF),
    Color(0xFF8065FF),
    Color(0xFF7B60FF),
    Color(0xFF755BFF),
    Color(0xFF7056FF),
    Color(0xFF6B51FF),
    Color(0xFF665CFF),
    Color(0xFF6157FF),
    Color(0xFF5B52FF),
    Color(0xFF565DFF),
    Color(0xFF5158FF),
    Color(0xFF4C53FF),
    Color(0xFF4750FF),
    Color(0xFF424BFF),
    Color(0xFF3D46FF),
    Color(0xFF3741FF),
    Color(0xFF323CFF),
    Color(0xFF2D37FF),
    Color(0xFF2832FF),
    Color(0xFF232DFF),
    Color(0xFF1E28FF),
    Color(0xFF1823FF),
    Color(0xFF131EFF),
    Color(0xFF0E19FF),
    Color(0xFF0914FF),
    Color(0xFF040FFF),
    Color(0xFF000AFF), // Light Sky Blue
  ];
  List<int> duration = [
    1066, 925, 1027, 1074, 1176, 800, 1129, 1121, 1184, 1051, 1192, 916, 1105,
    1152, 1058, 978, 972, 939, 962, 1068, 988, 899, 888, 898, 845, 1129, 966,
    907, 1108, 1158, 963, 963, 857, 1037, 988, 1077, 825, 917, 1105, 1211, 1186,
    1147, 872, 1082, 843, 899, 966, 1123, 1145, 1066,
  ];
  bool isPlaying;
  PlayBarsVisualizer({
    Key? key,
    
    required this.isPlaying,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(50, (index) =>MusicPlayVisualizer(duration: duration[index%37], color: colors[index%37],isAnimaiting: isPlaying,) ));
  }
}
