import 'package:flutter/material.dart';
import 'package:game_tv/pages/utils.dart';
import 'package:game_tv/provider/tournament_saervice_provider.dart';
import 'package:provider/provider.dart';

import 'card.dart';

class TournamentList extends StatefulWidget {
  TournamentList({Key? key}) : super(key: key);

  @override
  State<TournamentList> createState() => _TournamentListState();
}

class _TournamentListState extends State<TournamentList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TournamentService>(builder: (context, t, child) {
      // if (_scrollController.position.pixels ==
      //     _scrollController.position.maxScrollExtent) {
      //   t.fetchList();
      // }

      return Flexible(
        child: ListView.builder(
          controller: _scrollController,
          itemBuilder: (ctx, i) {
            if (i == t.count) {
              if (t.isLoading) return CircularProgressIndicator();
              if (t.isLast) {
                return Container(
                  padding: EdgeInsets.all(16),
                  child: Text('Reached End of list'),
                );
              }
              return HS(16);
            }

            final tournament = t.getItem(i);
            return RecommendedCard(
              tournament: tournament,
            );
          },
          itemCount: t.count + 1,
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
