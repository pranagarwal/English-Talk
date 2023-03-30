import 'package:english_talk/services/auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:english_talk/models/user.dart' as model;

class UserProvider with ChangeNotifier {
  model.User? _user;
  final AuthMethods _authMethods = AuthMethods();
  model.User get getUser => _user!;

  Future refreshUser() async {
    model.User user = await _authMethods.getUserDetails();
    _user = user;

    notifyListeners();
  }
}
