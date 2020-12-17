import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sca_ui/models/user.dart';

import '../locator.dart';
import 'firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  Users _currentUser;

  Users get currentUser => _currentUser;

  Future loginWithEmail(
    @required String email,
    @required String password,
  ) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      await populateCurrentUser(user.user);
      return user != null;
    } catch (e) {
      return e.code;
    }
  }

  Future signupWithEmail(
      {@required String email,
      @required String password,
      @required String firstname,
      @required String lastname,
      @required String phonenumber,
      }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      //create a new user profile on firestore
      _currentUser = Users(
          userid: authResult.user.uid,
          email: email,
          firstname: firstname,
          lastname: lastname,
          phonenumber: phonenumber);
      print(authResult.user);
      if(authResult.user != null) {
        await _firestoreService.create(currentUser);
      }else{
        Fluttertoast.showToast(msg: "A database error occured while creating your account, reach out to us via email: priscillaachizue@gmail.com", toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.deepOrangeAccent[400]);
//        print("A database error occured while creating your account, reach out to us on here email: zadencapital@gmail.com")
      }

      return authResult.user != null;
    } catch (e) {
      return e.code;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    await populateCurrentUser(user);
    return user != null;
  }

  Future populateCurrentUser(User user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
  Future signout(context) async{
   await FirebaseAuth.instance.signOut();
  }
}
