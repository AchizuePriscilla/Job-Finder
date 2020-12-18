import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sca_ui/models/user.dart';
import 'package:sca_ui/routes/route_names.dart';
import 'package:sca_ui/viewmodels/base_model.dart';

class RegisterScreenViewModel extends BaseModel {
  Future SignUpWithEmailAndPassword(
      {@required Users users, @required BuildContext context}) async {
    if (users.lastname.isEmpty ||
        users.firstname.isEmpty ||
        users.password.isEmpty ||
        users.phonenumber.isEmpty)
      return Fluttertoast.showToast(
          msg: "Field(s) cannot be empty",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.blue);
    setBusy(true);
    String errorMessage = "";

    var result = await authenticationService.signupWithEmail(users: users);

    if (result is bool) {
      if (result) {
        setBusy(false);
        Navigator.of(context)
            .pushReplacementNamed(RouteNames.descriptionScreen);
      } else {
        setBusy(false);
        errorMessage = "Sign up failed";
      }
    } else {
      setBusy(false);
      print(result);
      errorMessage = result;
    }
    print(result);
    print("The error message is $errorMessage");
    Fluttertoast.showToast(
      msg: errorMessage,
      backgroundColor: Colors.blue,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
