import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_booking/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../Constants/utils.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmail(BuildContext context, String name, String email, String password, Color color) async{
    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await credential.user?.updateDisplayName(name);
      return credential.user;
    } on FirebaseAuthException catch(e) {
      if(e.code == 'email-already-in-use'){
        showSnackBar(context, 'The email is already in use', color);
      } else {
        showSnackBar(context, 'Error: ${e.code}', color);
      }
    }
    return null;
  }

  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushAndRemoveUntil(context, PageTransition(child: const LoginScreen(), type: PageTransitionType.rightToLeft), (route) => false);
  }

  Future<User?> signInWithEmail(BuildContext context, String email, String password, Color color) async{
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch(e) {
      if(e.code == 'user-not-found') {
        showSnackBar(context, 'Please check your Email', color);
      } else if(e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong Password', color);
      } else {
        showSnackBar(context, 'Error: ${e.code}', color);
      }
    }
    return null;
  }
}