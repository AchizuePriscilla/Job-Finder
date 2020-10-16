import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
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
}
