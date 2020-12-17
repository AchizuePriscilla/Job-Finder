import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sca_ui/models/user.dart';
import 'package:sca_ui/services/authentication_service.dart';
import 'package:sca_ui/services/firestore_service.dart';

import '../locator.dart';

class BaseModel extends ChangeNotifier {

  final AuthenticationService authenticationService = locator<AuthenticationService>();
  FirestoreService firestoreService = locator<FirestoreService>();

  Users get currentUser => authenticationService.currentUser;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

}
