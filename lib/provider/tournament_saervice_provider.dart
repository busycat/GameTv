import 'package:flutter/cupertino.dart';
import 'package:game_tv/models/response.dart';

import 'package:http/http.dart' as http;

abstract class TournamentService with ChangeNotifier {
  Future<void> fetchList();
  Tournament getItem(int i);
  int get count;
  bool get isLast;
}

class HttpTournamentService extends TournamentService {
  String cursor = '';
  List<Tournament> t = [];
  @override
  int get count => t.length;

  @override
  Future<void> fetchList() async {
    final response = await http.get(Uri.parse(
      'https://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?lmit=10&status=all&cursor=$cursor',
    ));

    final parsed = recommendationDtoFromJson(response.body);
    t.addAll(parsed.data.tournaments);
    cursor = parsed.data.cursor;
  }

  @override
  Tournament getItem(int i) {
    return t[i];
  }

  @override
  bool get isLast => false;
}
