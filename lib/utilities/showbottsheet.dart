import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notegenierecreated/features/recordeScreen/views/musicplayer.dart';
import 'package:notegenierecreated/features/recordeScreen/views/recorder.dart';

void ShowBottomSheetView(BuildContext context,Widget widget,WidgetRef ref){
  showModalBottomSheet(
   
    
    context: context, builder: (context){
    
   return widget;
  },
  
  ).whenComplete((){
    ref.watch(PlayingProvider.notifier).update((state) => false);
    ref.watch(RecordPathProvider.notifier).update((state) => '');
    ref.watch(isClickedProvider.notifier).update((state) => false);
   
  });
}