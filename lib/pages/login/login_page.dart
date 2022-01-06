import 'package:flutter/material.dart';
import 'package:game_tv/configs/routes.dart';
import 'package:game_tv/provider/user_service_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<UserService>(builder: (context, userService, child) {
      onLogin() async {
        await userService.login('123', '456');
        if (userService.isAuthenticated) {
          Navigator.of(context).pushNamed(homePageRoute);
        }
      }

      return SafeArea(
        child: Column(
          children: [
            Text('Login Page'),
            Text('Error : ' + (userService.error ?? 'None')),
            Text(userService.isAuthenticated ? 'LoggedIn' : 'Not Loggedin'),
            TextButton(onPressed: onLogin, child: Text('Login'))
          ],
        ),
      );
    }));
  }
}