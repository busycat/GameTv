import 'package:flutter/material.dart';
import 'package:game_tv/pages/index.dart';
import 'package:game_tv/provider/user_service_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SlashScreen extends StatelessWidget {
  static const route = '/splash';
  const SlashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Scaffold(
        body: Consumer<UserService>(builder: (context, userService, child) {
      Future<void> checkLogin(BuildContext context) async {
        var sp = await SharedPreferences.getInstance();
        try {
          // Can be race--??
          var key = sp.getString(loggedInUserKey);
          var pass = sp.getString(loggedInPassKey);
          if (key != null &&
              pass != null &&
              key.isNotEmpty &&
              pass.isNotEmpty) {
            await userService.login(key, pass);
            Navigator.of(context).popAndPushNamed(HomePage.route);
          } else {
            Navigator.of(context).popAndPushNamed(Login.route);
          }
        } on Exception {
          // Handle Error
        }
        return;
      }

      checkLogin(context);
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.grey.shade900),
        child: Image(
          image: AssetImage('assets/images/game.tv-logo.png'),
          width: 0.6 * mq.size.width,
        ),
      );
    }));
  }
}
