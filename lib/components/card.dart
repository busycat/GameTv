import 'package:flutter/material.dart';
import 'package:game_tv/models/response.dart';
import 'package:game_tv/pages/utils.dart';

class RecommendedCard extends StatelessWidget {
  final Tournament tournament;
  const RecommendedCard({Key? key, required this.tournament}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 7 / 2,
            child: FittedBox(
              fit: BoxFit.cover,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                image: NetworkImage(tournament.coverUrl),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tournament.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w600),
                        maxLines: 1,
                      ),
                      HS(0.5),
                      Text(
                        tournament.gameName,
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
