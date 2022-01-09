import 'package:flutter/material.dart';
import 'package:game_tv/abstraction/app_exception.dart';
import 'package:game_tv/abstraction/login_service.dart';
import 'package:game_tv/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

const loggedInUserKey = 'user:id';
const loggedInPassKey = 'user:pass';

class UserService with ChangeNotifier {
  UserProfile? _user;
  String? error;
  Future<void> login(String user, String password) async {
    error = null;
    try {
      final userObj = await loginService.login(user, password);

      var sp = await SharedPreferences.getInstance();
      sp.setString(loggedInUserKey, user);
      sp.setString(loggedInPassKey, password);

      _user = userObj;
    } on AppException catch (e) {
      error = e.error;
    }
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  Future<void> logout(void Function() callback) async {
    final token = _user?.token;
    if (token == null) {
      throw AppException(error: "User Token doesn't exist", code: 500);
    }

    var sp = await SharedPreferences.getInstance();
    // Can do Clear
    sp.remove(loggedInUserKey);
    sp.remove(loggedInPassKey);
    await loginService.logout();
    callback();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  bool get isAuthenticated => _user?.token.isNotEmpty ?? false;
  String get username => isAuthenticated
      ? _user!.name
      : throw AppException(error: 'Invalid State', code: 0);
  UserProfile get user => _user!;
  int get age => isAuthenticated
      ? _user!.age
      : throw AppException(error: 'Invalid State', code: 0);
}
