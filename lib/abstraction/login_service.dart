import 'package:game_tv/abstraction/app_exception.dart';
import 'package:game_tv/models/user.dart';

abstract class LoginService {
  Future<User> login(String user, String password);
  Future<void> logout(String token);
}

class MockLoginService extends LoginService {
  static final Map<String, String> credentials = {
    '9898989898': 'password123',
    '9876543210': 'password123',
  };
  static final Map<String, User> users = {
    '9898989898': const User(name: 'Simon Baker', age: 25, token: '1234'),
    '9876543210': const User(name: 'Dikki  Hanger', age: 22, token: '1234'),
  };
  @override
  Future<User> login(String user, String password) async {
    await Future<void>.delayed(Duration(seconds: 1));
    // Check User Exists
    if (credentials.containsKey(user)) {
      if (credentials[user] == password) {
        /// Now we know User is a Valid user with Correct Password
        final userObj = users[user];
        if (userObj != null) {
          return userObj;
        } else {
          throw const AppException(error: 'Backend Error', code: 500);
        }
      }
    }
    throw const AppException(error: 'Invalid Username Password', code: 401);
  }

  @override
  Future<void> logout(String token) =>
      Future<void>.delayed(Duration(seconds: 1));
}
