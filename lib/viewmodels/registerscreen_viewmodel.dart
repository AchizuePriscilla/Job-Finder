import 'package:stacked/stacked.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sca_ui/views/screens/login_screen.dart';
import 'package:sca_ui/views/screens/register_screen.dart';

class RegisterScreenViewModel extends BaseViewModel {
  List<String> userTypeList = ['Recruiter', 'Job Seeker'];
  var currentItem = 'Recruiter';

  // final _auth = FirebaseAuth.instance;
  // LoginScreen loginScreen = LoginScreen();
  // String email;
  // String password;

  // registerUser() async {
  //   try {
  //     final newUser = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     if (newUser != null) {
  //       return newUser;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
