import 'package:flutter/material.dart';
import 'package:game_tv/configs/routes.dart';
import 'package:game_tv/pages/home/home_page.dart';
import 'package:game_tv/pages/index.dart';
import 'package:game_tv/provider/user_service_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserService()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: loginPageRoute,
      routes: {
        loginPageRoute: (ctx) => Login(),
        homePageRoute: (ctx) => HomePage(),
      },
    );
  }
}
