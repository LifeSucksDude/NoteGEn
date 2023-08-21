import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Widgets/differentBottom.dart';

import '../constants/themeDark.dart';
import '../features/recordeScreen/views/recorder.dart';

class PlayPause extends ConsumerWidget {
 
  const PlayPause({super.key,});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
     
     final screeHeight=MediaQuery.of(context).size.height;
     final screeWidth=MediaQuery.of(context).size.height;
    return  
      
       
       Container(
       
        
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
              if(!ref.read(isClickedProvider))
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
          
              if(ref.read(isClickedProvider))
               Container(
                height: 20 * screeHeight / 932,
                width: 20 * screeHeight / 932,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius:
                        BorderRadius.all(Radius.circular(4 * screeHeight / 932))),
              ),
    
            ],
          ),
        
      
    );
  }
}