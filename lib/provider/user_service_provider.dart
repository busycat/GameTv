import 'package:flutter/material.dart';
import 'package:game_tv/abstraction/app_exception.dart';
import 'package:game_tv/abstraction/login_service.dart';
import 'package:game_tv/models/user.dart';

class UserService with ChangeNotifier {
  static final LoginService _loginService = MockLoginService();
  User? _user;
  Future<void> login(String user, String password) async {
    final userObj = await _loginService.login(user, password);

    /// TODO Save Info to Local/Persisting Storage
    _user = userObj;

    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  Future<void> logout() async {
    final token = _user?.token;
    if (token == null) {
      throw AppException(error: "User Token doesn't exist", code: 500);
    }
    await _loginService.logout(token);

    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  bool get isAuthenticated => _user?.token.isNotEmpty ?? false;
  String get username => _user?.name ?? '';
  int get age => isAuthenticated
      ? _user!.age
      : throw AppException(error: 'error', code: 0);
}
