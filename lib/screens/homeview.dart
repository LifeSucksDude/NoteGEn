import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notegenierecreated/constants/assetsImage.dart';
import 'package:notegenierecreated/features/notificationspage/views/notifpage.dart';
import 'package:notegenierecreated/utilities/cateoriser.dart';
import 'package:notegenierecreated/utilities/topnavbar.dart';
import 'package:notegenierecreated/utilities/uitabspage.dart';
import '../constants/themeDark.dart';
import '../widgetforapp/playit.dart';

class HomeView extends ConsumerWidget {
 
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
  
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final _selectedIndex=ref.watch(selectedCategoriserIndexProvider);
    return Scaffold(
      backgroundColor: DarkTheme.bgcol,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:16.0,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   TopNavigationBar(),
                   
                    Padding(
                      padding: const EdgeInsets.only(right:15.0),
                      child: Row(
                        children: [
                           GestureDetector(
                             onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                               return NotifPage();

                              }));
                             },
                             child: Container(
                                                 height: 28,
                                                 width: 28,
                                                 decoration: const BoxDecoration(
                                                   image: DecorationImage(image: AssetImage(AssetImages.notifICon))
                                                 ),
                                               ),
                           ),
                  const  SizedBox(width: 15,),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(image:  AssetImage(AssetImages.squircle) ),
                                  borderRadius: BorderRadius.circular(10),
                                 
                                ),
                              ),
                              Container(
                                height: 23,
                                width: 23,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: DarkTheme.bgcol,
                                ),
                                child: Image(image: AssetImage(AssetImages.userIcon)),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
             Container(
              child: MultipleUiPages().uiTabBarPages[ _selectedIndex!],
             ),
             Expanded(child: SizedBox()),
              Divider(
                height: 0.5,
              ),
               SizedBox(height: 10,),
              PlayButton(),
              SizedBox(
                height: screenHeight * 2 / 932,
              )
            ],
          ),
        ),
      ),
    );
  }
}
