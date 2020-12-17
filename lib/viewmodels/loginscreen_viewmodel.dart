import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sca_ui/routes/route_names.dart';
import 'package:sca_ui/viewmodels/base_model.dart';
import 'package:stacked/stacked.dart';

class LoginScreenViewModel extends BaseModel {

  Future login({@required BuildContext context, @required String email, @required String password}) async {
    String errorMessage = "";
    if(email.isEmpty){
      Fluttertoast.showToast(msg: "Enter a valid email address", backgroundColor: Colors.blue);
    }else if(password.isEmpty){
      Fluttertoast.showToast(msg: "Enter a valid password", backgroundColor: Colors.blue);
    }else if(password.length <  6){
      Fluttertoast.showToast(msg: "Password too short", backgroundColor: Colors.blue);
    }else {
      setBusy(true);

      var result = await authenticationService.loginWithEmail(email, password);
      setBusy(false);

      if (result is bool) {
        if (result) {
          Navigator.pop(context);
         Navigator.of(context).pushReplacementNamed(RouteNames.descriptionScreen);
        } else {
          Fluttertoast.showToast(msg: "Login Failed");
        }
      } else {
        switch (result) {
          case "ERROR_INVALID_EMAIL":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "ERROR_WRONG_PASSWORD":
            errorMessage = "Your password is wrong.";
            break;
          case "ERROR_USER_NOT_FOUND":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "ERROR_USER_DISABLED":
            errorMessage = "User with this email has been disabled.";
            break;
          case "ERROR_TOO_MANY_REQUESTS":
            errorMessage = "Too many requests. Try again later.";
            break;
          case "ERROR_OPERATION_NOT_ALLOWED":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          case "ERROR_NETWORK_REQUEST_FAILED":
            errorMessage = "Please, check your internet connection";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        print(result);
        print("The error message is $errorMessage");
        Fluttertoast.showToast(msg: errorMessage, backgroundColor: Colors.blue);
      }
    }
  }
}
