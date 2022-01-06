import 'package:flutter/material.dart';
import 'package:game_tv/abstraction/app_exception.dart';
import 'package:game_tv/provider/user_service_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? error;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<UserService>(builder: (context, userService, child) {
      return SafeArea(
        child: Column(
          children: [
            Text('Login Page'),
            Text('Error : ' + (error ?? 'None')),
            Text(userService.isAuthenticated ? 'LoggedIn' : 'Not Loggedin'),
            TextButton(
                onPressed: () {
                  try {
                    userService.login('123', '456');
                  } on AppException catch (e) {
                    setState(() {
                      error = e.error;
                    });
                    print('XXXXXXXXXXXXXXXX');
                  }
                },
                child: Text('Login'))
          ],
        ),
      );
    }));
  }
}
