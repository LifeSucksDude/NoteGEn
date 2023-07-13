// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositoryatuth/authrepo.dart';
final authControllerProvider=Provider((ref){
  final authRepository=ref.watch(authRepositoryProvider);
  return AuthController(authRepository:authRepository );
});
class AuthController {
  final AuthRepository authRepository;

  AuthController({
    required this.authRepository,
  });
  void signUpEmail(String email,String password,BuildContext context){
    authRepository.SignUpUser( email, password, context);
  }
  void googleSignInController(BuildContext context){
    authRepository.googleSignIn(context);

  }
}
