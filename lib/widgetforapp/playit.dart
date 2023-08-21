import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notegenierecreated/Widgets/differentBottom.dart';
import 'package:notegenierecreated/utilities/showbottsheet.dart';
import 'package:notegenierecreated/widgetforapp/recim.dart';

import '../constants/themeDark.dart';

class PlayButton extends ConsumerWidget {
 
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
  
    final screeHeight = MediaQuery.of(context).size.height;
    final screeWidth = MediaQuery.of(context).size.width;
    return Container(
      child: GestureDetector(
        onTap:(){
          debugPrint("enterde");
          ShowBottomSheetView(context, RecORIm(),ref);
        },
        onLongPress: (){
         
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 64 * screeHeight / 932,
              width: 64 * screeHeight / 932,
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.4),
                  borderRadius:
                      BorderRadius.all(Radius.circular(40 * screeHeight / 932))),
            ),
            Container(
              height: 55 * screeHeight / 932,
              width: 55 * screeHeight / 932,
              decoration: BoxDecoration(
                  color: DarkTheme.bgcol,
                  borderRadius:
                      BorderRadius.all(Radius.circular(40 * screeHeight / 932))),
            ),
            Container(
              height: 48 * screeHeight / 932,
              width: 48 * screeHeight / 932,
              decoration: BoxDecoration(
                  color: DarkTheme.red,
                  borderRadius:
                      BorderRadius.all(Radius.circular(40 * screeHeight / 932))),
            ),
           const SizedBox(
              height: 22,
              width: 22,
              child: Icon(Icons.add,color: Colors.white,size: 22,),
            )
          ],
        ),
      ),
    );
  }
}
