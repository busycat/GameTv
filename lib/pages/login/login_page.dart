import 'package:flutter/material.dart';
import 'package:game_tv/abstraction/login_service.dart';
import 'package:game_tv/pages/home/home_page.dart';
import 'package:game_tv/provider/user_service_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const route = '/login';

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController =
          TextEditingController(text: credentials.keys.first),
      _passwordController =
          TextEditingController(text: credentials.values.first);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<UserService>(builder: (context, userService, child) {
      final mq = MediaQuery.of(context).size.width;

      onLogin() async {
        await userService.login(
          _usernameController.text,
          _passwordController.text,
        );
        if (userService.isAuthenticated) {
          Navigator.of(context).popAndPushNamed(HomePage.route);
        }
      }

      return SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0x00000000),
                ),
                child: Image(
                  image: AssetImage('assets/images/game.tv-logo.png'),
                  width: 0.5 * mq,
                ),
              ),
              Text('Login Page'),
              TextField(
                controller: _usernameController,
              ),
              TextField(
                controller: _passwordController,
              ),
              Text('Error : ' + (userService.error ?? 'None')),
              Text(userService.isAuthenticated ? 'LoggedIn' : 'Not Loggedin'),
              TextButton(onPressed: onLogin, child: Text('Login'))
            ],
          ),
        ),
      );
    }));
  }
}
