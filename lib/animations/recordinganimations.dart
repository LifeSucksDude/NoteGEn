import 'package:flutter/material.dart';
import 'package:notegenierecreated/constants/themeDark.dart';

class RecordMusicVisualizer extends StatefulWidget {
  final int duration;
  final Color color;
  const RecordMusicVisualizer({super.key, required this.duration, required this.color});

  @override
  State<RecordMusicVisualizer> createState() => _RecordMusicVisualizerState();
}

class _RecordMusicVisualizerState extends State<RecordMusicVisualizer> with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? animationController;
  @override
  void initState() {
    animationController=AnimationController(duration: Duration(milliseconds: widget.duration,),vsync: this);
    final curvedAnimation=CurvedAnimation(parent: animationController!, curve: Curves.slowMiddle);
    animation=Tween<double>(begin: 0,end:100).animate(curvedAnimation)..addListener(() {
      setState(() {
        
      });
    });
    animationController!.repeat(reverse: true);
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
   animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4.67,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(15),
      ),
      height: animation!.value,
    );
  }
}
class BarsVisualizer extends StatelessWidget {
List<Color> colors = [
  Color.fromARGB(255, 128, 0, 128),
  Color.fromARGB(255, 115, 0, 141),
  Color.fromARGB(255, 102, 0, 154),
  Color.fromARGB(255, 89, 0, 167),
  Color.fromARGB(255, 76, 0, 180),
  Color.fromARGB(255, 63, 0, 193),
  Color.fromARGB(255, 51, 0, 204),
  Color.fromARGB(255, 39, 0, 216),
  Color.fromARGB(255, 26, 0, 229),
  Color.fromARGB(255, 13, 0, 242),
  Color.fromARGB(255, 0, 0, 255),
  Color.fromARGB(255, 0, 13, 242),
  Color.fromARGB(255, 0, 26, 229),
  Color.fromARGB(255, 0, 39, 216),
  Color.fromARGB(255, 0, 51, 204),
  Color.fromARGB(255, 0, 63, 193),
  Color.fromARGB(255, 0, 76, 180),
  Color.fromARGB(255, 0, 89, 167),
  Color.fromARGB(255, 0, 102, 154),
  Color.fromARGB(255, 117, 192, 250),
  Color.fromARGB(255, 10, 146, 224),
  Color.fromARGB(255, 17, 170, 217),
  Color.fromARGB(255, 21, 154, 217),
  Color.fromARGB(255, 10, 167, 246),
  Color.fromARGB(255, 0, 180, 250),
  Color.fromARGB(255, 128, 165, 225),
  Color.fromARGB(255, 110, 145, 241),
  Color.fromARGB(255, 124, 175, 246),
  Color.fromARGB(255, 172, 178, 243),
  Color.fromARGB(255, 125, 209, 245),
   Color.fromARGB(255, 117, 209, 249),
  Color.fromARGB(255, 145, 193, 245),
  Color.fromARGB(255, 150, 208, 245),
  Color.fromARGB(255, 86, 162, 193),
  Color.fromARGB(255, 153, 210, 237),
  Color.fromARGB(255, 142, 160, 220),
  Color.fromARGB(255, 121, 165, 165),
  Color.fromARGB(255, 74, 135, 170),
  Color.fromARGB(255, 125, 165, 196),
];



 List<int> duration = [
    1066, 925, 1027, 1074, 1176, 800, 1129, 1121, 1184, 1051, 1192, 916, 1105,
    1152, 1058, 978, 972, 939, 962, 1068, 988, 899, 888, 898, 845, 1129, 966,
    907, 1108, 1158, 963, 963, 857, 1037, 988, 1077, 825, 917, 1105, 1211, 1186,
    1147, 872, 1082, 843, 899, 966, 1123, 1145, 1066,
  ];
   BarsVisualizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(50, (index) =>RecordMusicVisualizer(duration: duration[index%37], color: colors[index%37]) ));
  }
}