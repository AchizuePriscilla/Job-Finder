import 'package:flutter/material.dart';

import 'base_model.dart';

class WelcomeScreenViewModel extends BaseModel {
  String _imageLink;
  String get imageLink => _imageLink;

  void loadPhoto() {
    try {
      setBusy(true);
      _imageLink =
          "https://turkishlaborlaw.com/wp-content/uploads/2016/10/private-employment-agency-regulation-in-turkey.jpg";
      notifyListeners();
      setBusy(false);
    } catch (e) {}
  }

  void checkIfUserIsLoggedIn(BuildContext context) {
    loadPhoto();
  }
}
