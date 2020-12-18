import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sca_ui/routes/route_names.dart';
import 'package:sca_ui/viewmodels/base_model.dart';

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
        errorMessage = result;
        }
        print(result);
        print("The error message is $errorMessage");
        Fluttertoast.showToast(msg: errorMessage, backgroundColor: Colors.blue);
      }
    }
}
