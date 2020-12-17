import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sca_ui/models/user.dart';
class FirestoreService{
  final CollectionReference _usersCollectionReference = FirebaseFirestore.instance.collection("users");

//  AuthenticationService _authenticationService = locator<AuthenticationService>();

  Future create(Users user) async{
    try{
      await _usersCollectionReference.doc(user.userid).set(user.toJson());
    }catch(e){
      return e.message;
    }
  }

  Future getUser(String uid) async{
    try{
      var userData = await _usersCollectionReference.doc(uid).get();
      return Users.fromData(userData.data());
    }catch(e){
      return e.message;
    }
  }

}