import 'package:flutter/material.dart';
import 'package:game_tv/components/app_header.dart';
import 'package:game_tv/components/card.dart';
import 'package:game_tv/models/response.dart';
import 'package:game_tv/pages/login/login_page.dart';
import 'package:game_tv/provider/user_service_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../utils.dart';

class HomePage extends StatelessWidget {
  static const route = '/home';
  final Future<http.Response> f = http.get(Uri.parse(
      'https://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all'));
  HomePage({Key? key}) : super(key: key);

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
                      SliverPersistentHeader(
                        delegate: AppHeader(user: user),
                        floating: true,
                        pinned: true,
                      ),
                      SliverAppBar(
                        pinned: true,
                        expandedHeight: 100,
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
                                VS(2),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        userService.username,
                                        style: TextStyle(fontSize: 32),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      HS(4),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                            border: Border.all(
                                                color: Colors.primaries.first,
                                                width: 2)),
                                        child: Row(
                                          children: [
                                            Text(
                                              user.rating.toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w800,
                                                  color:
                                                      Colors.primaries.first),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              'Elo Rating',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
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
