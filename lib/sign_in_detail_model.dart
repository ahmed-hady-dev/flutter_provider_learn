import 'package:flutter/foundation.dart';

class SignInDetailsModel with ChangeNotifier {
  String _userName = "";
  String _password = "";

  DateTime _signInOn;
  String get user => _userName;
  String get pass => _password;
  DateTime get signInOn => _signInOn;

  void signInUserName(String userName) {
    _userName = userName;
    _signInOn = DateTime.now();
    notifyListeners();
  }

  void signInPassword(String password) {
    _password = password;
    _signInOn = DateTime.now();
    notifyListeners();
  }
}
