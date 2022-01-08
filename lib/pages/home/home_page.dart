import 'package:flutter/material.dart';
import 'package:game_tv/pages/login/login_page.dart';
import 'package:game_tv/provider/user_service_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserService>(builder: (context, userService, child) {
        void logoutCb() {
          Navigator.of(context).popAndPushNamed(Login.route);
        }

        return CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              actions: [
                TextButton(
                  child: Text('Logout'),
                  onPressed: () {
                    userService.logout(logoutCb);
                  },
                )
              ],
              title: Text(userService.user.title),
              centerTitle: true,
              backgroundColor: Colors.black,
            ),
            SliverToBoxAdapter(
              child: Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image(
                          image: NetworkImage(
                              'https://thispersondoesnotexist.com/image'),
                          width: 100,
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Text(
                              userService.username,
                              style: TextStyle(fontSize: 32),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (a, b) {
                  return Container(
                    padding: EdgeInsets.all(50),
                    child: Text('Hello'),
                  );
                },
                childCount: 10,
              ),
            )
          ],
        );
      }),
    );
  }
}
