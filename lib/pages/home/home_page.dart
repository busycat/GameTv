import 'package:flutter/material.dart';
import 'package:game_tv/components/app_header.dart';
import 'package:game_tv/components/card.dart';
import 'package:game_tv/models/response.dart';
import 'package:game_tv/pages/login/login_page.dart';
import 'package:game_tv/provider/user_service_provider.dart';
import 'package:provider/provider.dart';

import '../utils.dart';

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

        final user = userService.user;

        return FutureBuilder(
            future: f,
            builder: (context, AsyncSnapshot<http.Response> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                final recommendation =
                    recommendationDtoFromJson(snapshot.data!.body);
                return SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        actions: [
                          TextButton(
                            child: Text('Logout'),
                            onPressed: () {
                              userService.logout(logoutCb);
                            },
                          )
                        ],
                        title: Text(user.title),
                        centerTitle: true,
                        backgroundColor: Colors.white,
                      ),
                      SliverPersistentHeader(
                        delegate: AppHeader(user: user),
                        floating: true,
                        pinned: true,
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          child: Text(
                            'Recommended for you',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (a, b) {
                            final tournament =
                                recommendation.data.tournaments[b];
                            return RecommendedCard(
                              tournament: tournament,
                            );
                          },
                          childCount: recommendation.data.tournaments.length,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: HS(16),
                      )
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            });
      }),
    );
  }
}
