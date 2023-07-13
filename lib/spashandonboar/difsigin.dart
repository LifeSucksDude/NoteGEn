import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notegenierecreated/features/authenticaton/controller/authcontroller.dart';

import '../constants/assetsImage.dart';
import '../constants/themeDark.dart';
import '../features/authenticaton/views/emailsign.dart';


class DifferentSignIn extends ConsumerWidget {
  const DifferentSignIn({super.key});
  void signInwithGoogle(WidgetRef ref,BuildContext context){
    ref.watch(authControllerProvider).googleSignInController(context);
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
     final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:
      Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:30*screenWidth/430),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                  height: screenHeight * 100 / 932,
                ),
            
              Text("Get Started Today!",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600,color: DarkTheme.textCol),),
              SizedBox(height:screenHeight * 100 / 932 ,),
              Text("You can continue by signing in through one of the following:",style: TextStyle(
                fontSize: 18,color: DarkTheme.lightCol,fontFamily: "Satoshi",fontWeight: FontWeight.w600
              ),),
            SizedBox(height: screenHeight*100/932,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                       signInwithGoogle(ref,context);
                      },
                      child: Center(
                        child: Container(
                          height: 88*screenHeight/932,
                          width: 88*screenWidth/430,
                          decoration: BoxDecoration(
                          color: DarkTheme.greyBoxCol,
                          borderRadius: BorderRadius.circular(22),
                          ),
                          child: Center(
                            child: Container(
                              height: 40*screenHeight/932,
                              width: 40*screenWidth/430,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(AssetImages.googleChrome))
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth*40/430,),
                    GestureDetector(
                      onTap: (){
                      
                      },
                      child: Center(
                        child: Container(
                          height: 88*screenHeight/932,
                          width: 88*screenWidth/430,
                          decoration: BoxDecoration(
                          color: DarkTheme.greyBoxCol,
                          borderRadius: BorderRadius.circular(screenHeight*22/932),
                          ),
                          child: Center(
                            child: Container(
                              height: 40*screenHeight/932,
                              width: 40*screenWidth/430,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(AssetImages.appleIcon))
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40*screenHeight/932,),
                 Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return
                          EmailAndDo();
                        }));
                      },
                      child: Center(
                        child: Container(
                          height: 88*screenHeight/932,
                          width: 88*screenWidth/430,
                          decoration: BoxDecoration(
                          color: DarkTheme.greyBoxCol,
                          borderRadius: BorderRadius.circular(22*screenHeight/932),
                          ),
                          child: Center(
                            child: Container(
                              height: 40*screenHeight/932,
                              width: 40*screenWidth/430,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(AssetImages.emailIcon))
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                   
                    
                  ],
                ),
              ),
              SizedBox(height: screenHeight*200/932,),
              Row(
                children: [
                  Text("By Signing up, you agree to our ",style: TextStyle(
                    color: DarkTheme.lightCol,fontSize: 16*screenHeight/932,fontWeight: FontWeight.w500
                  ),),
                  Text("Privacy Policy ",style: TextStyle(
                    color: DarkTheme.prblue,fontSize: 16*screenHeight/932,fontWeight: FontWeight.w500
                  ),),
                
                ],
              ),
              Row(
                children: [
                  Text("and ",style: TextStyle(
                    color: DarkTheme.lightCol,fontSize: 16*screenHeight/932,fontWeight: FontWeight.w500
                  ),),
                  Text("Terms of Service",style: TextStyle(
                    color: DarkTheme.prblue,fontSize: 16*screenHeight/932,fontWeight: FontWeight.w500
                  ))
                ],
              )
              
            ]),
        ),
      ),
      
    );
  }
}