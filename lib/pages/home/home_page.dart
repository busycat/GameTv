import 'package:flutter/material.dart';
import 'package:game_tv/components/card.dart';
import 'package:game_tv/components/insights.dart';
import 'package:game_tv/pages/index.dart';
import 'package:game_tv/provider/tournament_saervice_provider.dart';
import 'package:game_tv/provider/user_service_provider.dart';
import 'package:provider/provider.dart';

import '../utils.dart';

class HomePage extends StatefulWidget {
  static const route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  late Future<void> Function() fetchList;
  late UserService userService;
  @override
  void initState() {
    super.initState();
    fetchList = context.read<TournamentService>().fetchList;
    userService = context.read<UserService>();
    updateList();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        updateList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    void logoutCb() {
      Navigator.of(context).popAndPushNamed(Login.route);
    }

    final user = userService.user;

    List<Widget> prefix = [
      Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            ClipOval(
              child: Image(image: NetworkImage(user.image), width: 100),
            ),
            VS(2),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  HS(2),
                  Container(
                    constraints: BoxConstraints(maxWidth: 136),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        border: Border.all(
                            color: Colors.primaries.first, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          user.rating.toString(),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Colors.primaries.first),
                          overflow: TextOverflow.ellipsis,
                        ),
                        VS(1),
                        Text(
                          'Elo Rating',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      InsightsCard(),
      HS(2),
      Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Text(
          'Recommended for you',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    ];
    int initialItems = prefix.length;

    return Consumer<TournamentService>(builder: (context, ts, child) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.list),
            onPressed: () {
              userService.logout(logoutCb);
            },
          ),
          title: Text(
            user.title,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          centerTitle: true,
          backgroundColor: Colors.white10,
          elevation: 0,
        ),
        body: SafeArea(
          child: ts.error != null && ts.error!.isNotEmpty
              ? Center(
                  child: Text(ts.error!),
                )
              : ListView.builder(
                  controller: _scrollController,
                  itemCount: ts.count + initialItems + 1,
                  itemBuilder: (ctx, i) {
                    if (i < initialItems) return prefix[i];
                    if (i == ts.count + initialItems) {
                      if (ts.isLoading) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 8,
                          ),
                          child: LinearProgressIndicator(),
                        );
                      }
                      if (ts.isLast) {
                        return Container(
                          padding: EdgeInsets.all(16),
                          child: Text('Reached End of list'),
                        );
                      }
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: TextButton(
                          child: Text('Click to load'),
                          onPressed: () {
                            updateList();
                          },
                        ),
                      );
                      // return HS(5);
                    }

                    return RecommendedCard(
                      tournament: ts.getItem(i - initialItems),
                    );
                  }),
        ),
      );
    });
  }

  Future<void> updateList() async {
    setState(() {});
    await fetchList();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
