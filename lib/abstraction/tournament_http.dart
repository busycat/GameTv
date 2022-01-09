import 'package:game_tv/abstraction/app_exception.dart';
import 'package:game_tv/models/response.dart';
import 'package:game_tv/models/user.dart';

import 'package:http/http.dart' as http;

abstract class TournamentService {
  Future<void> fetchList();
  Tournament getItem(int i);
  int get count;
}

class _HttpTournamentService extends TournamentService {
  List<Tournament> t = [];
  @override
  int get count => t.length;

  @override
  Future<void> fetchList() async {
    final response = await http.get(Uri.parse(
        'https://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?lmit=10&status=all'));

    final parsed = recommendationDtoFromJson(response.body);
    t.addAll(parsed.data.tournaments);
  }

  @override
  Tournament getItem(int i) {
    return t[i];
  }
}

final TournamentService loginService = _HttpTournamentService();
