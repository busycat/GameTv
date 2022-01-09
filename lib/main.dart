import 'package:flutter/material.dart';
import 'package:game_tv/pages/index.dart';
import 'package:game_tv/provider/tournament_saervice_provider.dart';
import 'package:game_tv/provider/user_service_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserService()),
      ChangeNotifierProvider<TournamentService>(
        create: (context) => HttpTournamentService(),
      ),
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
      debugShowCheckedModeBanner: false,
      initialRoute: SlashScreen.route,
      routes: {
        Login.route: (ctx) => Login(),
        HomePage.route: (ctx) => HomePage(),
        SlashScreen.route: (ctx) => SlashScreen(),
      },
    );
  }
}
