import 'package:flutter/material.dart';
import 'package:game_tv/provider/tournament_saervice_provider.dart';
import 'package:provider/provider.dart';

import 'card.dart';

class TournamentList extends StatelessWidget {
  TournamentList({Key? key}) : super(key: key);
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TournamentService>(builder: (context, t, child) {
      return Flexible(
        child: ListView.builder(
          controller: _scrollController,
          itemBuilder: (ctx, i) {
            final tournament = t.getItem(i);
            return RecommendedCard(
              tournament: tournament,
            );
          },
          itemCount: t.count,
        ),
      );
    });
  }
}
