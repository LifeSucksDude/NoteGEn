import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notegenierecreated/Widgets/snackbar.dart';
import 'package:notegenierecreated/constants/themeDark.dart';
import 'package:notegenierecreated/features/authenticaton/controller/authcontroller.dart';
import 'package:notegenierecreated/utilities/customTextField.dart';
import 'package:notegenierecreated/utilities/custombutton.dart';

class EmailAndDo extends ConsumerStatefulWidget {
  const EmailAndDo({super.key});

  @override
  ConsumerState<EmailAndDo> createState() => _EmailAndDoState();
}

class _EmailAndDoState extends ConsumerState<EmailAndDo> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
   void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    
  }
   void SignUserIn(){
     String email=emailController.text.trim();
     String password=passwordController.text.trim();
     
     if(email.isNotEmpty && password.isNotEmpty){
     ref.read(authControllerProvider).signUpEmail(email, password, context);
     }
     else{
      showSnackBar(context: context, content: "Please add the required fields");
     }
    }
  @override
  Widget build(BuildContext context) {
   
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: DarkTheme.bgcol,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100*screenHeight/932,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20*screenWidth/430),
              child: Text("Let's create you email and password!",style: TextStyle(fontSize: 28*screenHeight/932,color: DarkTheme.textCol,fontWeight: FontWeight.w500),),
            ),
             SizedBox(height: 100*screenHeight/932,),
            CustomTextFieldApp(hintText: "Email", enabledBorderColor: DarkTheme.greyBoxCol, backgroundColor: DarkTheme.greyBoxCol, controller: emailController, focusedBOrderColor: DarkTheme.purple ),
            SizedBox(height:50*screenHeight/932),
            Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Container(
          height: 56,
          child: Center(
            child: TextFormField(
              autocorrect: false,
            controller: passwordController,
            decoration: InputDecoration(
               focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:  BorderSide(color: DarkTheme.purple,width: 1)
                
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: DarkTheme.greyBoxCol,width: 1),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              hintText: "Password",
              hintStyle: const TextStyle(fontSize: 18),
            fillColor: DarkTheme.greyBoxCol,
            
            filled: true
            ),
                
              ),
          ),
        ),
      ),
      SizedBox(height: screenHeight*100/932,),
      CustomButton(onTap: (){
        SignUserIn();
      }, text: "Sign Up", textColor: DarkTheme.whiteCol)

            ],
          ),
        ),
      ),
    );
  }
}