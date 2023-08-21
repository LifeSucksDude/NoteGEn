// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCategoriserIndexProvider = StateProvider<int?>((ref) => 0);

class Categoriser extends ConsumerWidget {
 final int index;
 final List<Color> colors;
 final  String whiteImage;
 final String darkImage;
 final Color shadowColor;
  final VoidCallback onTap;
 
  const Categoriser({
    required this.index,
    required this.colors,
    required this.whiteImage,
    required this.darkImage,
    required this.shadowColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
     final selectedIndex = ref.watch(selectedCategoriserIndexProvider);
       final isselected = selectedIndex == index;
   
    return isselected? Stack(
      alignment: Alignment.center,
      children: [
       
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            gradient: LinearGradient(colors: colors,begin: Alignment.topLeft,end: Alignment.bottomRight ),
            boxShadow: [
              BoxShadow(
               color: shadowColor,
               blurRadius: 10.0,
               offset: Offset(10,8 ),
               blurStyle: BlurStyle.normal
              )
            ]
          ),
          
          height: 30,
          width: 49,
         
        

        ),
         Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(whiteImage))
     ),
      ),
      ],
    ):GestureDetector(
      onTap: (){
        onTap;
        ref.read(selectedCategoriserIndexProvider.notifier).update((state) => index);
      },
      child: SizedBox(
        height: 20,
        width: 30,
        child: Container(
          height: 20,
          width: 20,
          child: Image(image: AssetImage(darkImage),fit: BoxFit.fitHeight,),
         
        ),
      ),
    );
  }
}
