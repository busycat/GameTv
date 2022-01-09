import 'package:flutter/material.dart';
import 'package:game_tv/models/response.dart';

class RecommendedCard extends StatelessWidget {
  final Tournament tournament;
  const RecommendedCard({Key? key, required this.tournament}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          Image(image: NetworkImage(tournament.coverUrl)),
          Text(tournament.tournamentId),
        ],
      ),
    );
  }
}
