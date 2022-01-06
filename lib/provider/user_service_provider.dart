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
  }

  Future<void> logout() async {
    final token = _user?.token;
    if (token == null) {
      throw AppException(error: "User Token doesn't exist", code: 500);
    }
    await _loginService.logout(token);
  }
}
