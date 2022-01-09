import 'package:game_tv/abstraction/app_exception.dart';
import 'package:game_tv/models/user.dart';

abstract class LoginService {
  Future<UserProfile> login(String user, String password);
  Future<void> logout();
}

/// Should be private, But intentionally made public to reuse later
final Map<String, String> credentials = {
  '9876543210': 'password123',
  '9898989898': 'password123',
};
final Map<String, UserProfile> _users = {
  '9898989898': const UserProfile(
    name: 'Simon Baker',
    age: 25,
    token: '1234',
    rating: 2250,
    title: 'Flyingwolf',
    id: '9898989898',
    image: 'https://thispersondoesnotexist.com/image',
  ),
  '9876543210': const UserProfile(
    name: 'Dikki  Hanger',
    age: 22,
    token: '1234',
    rating: 2250,
    title: 'Flyingwolf',
    id: '9876543210',
    image: 'https://thispersondoesnotexist.com/image',
  ),
};

class _MockLoginService extends LoginService {
  @override
  Future<UserProfile> login(String user, String password) async {
    await Future<void>.delayed(Duration(seconds: 1));
    // Check User Exists
    if (credentials.containsKey(user)) {
      if (credentials[user] == password) {
        /// Now we know User is a Valid user with Correct Password
        final userObj = _users[user];
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
  Future<void> logout() async {
    Future<void>.delayed(Duration(seconds: 1));
  }
}

final LoginService loginService = _MockLoginService();
