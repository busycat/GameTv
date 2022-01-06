import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Text('Login Page'),
    ));
  }
}
