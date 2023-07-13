// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../Widgets/snackbar.dart';
final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance, googleSignIn: GoogleSignIn(),
   
  ),
);
class AuthRepository {
  final FirebaseAuth auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required this.auth,
    required googleSignIn
  }):_googleSignIn=googleSignIn;

  void SignUpUser(
      String email, String password, BuildContext context) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      showSnackBar(context: context, content: "Signed in");
     // Navigator.push(context, LoginPageView.route());
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }
  googleSignIn(BuildContext context)async{
    try{
    final user=await _googleSignIn.signIn();
    final GoogleSignInAuthentication gAuth=await user!.authentication;
    final credentials=GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );
    if(user!=null){
      print(user.photoUrl);
      print(user.displayName);
    }
    return await auth.signInWithCredential(credentials);
    }
    catch(e){
      showSnackBar(context: context, content: e.toString());
    }
  }
}
