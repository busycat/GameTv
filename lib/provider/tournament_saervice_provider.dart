import 'package:flutter/cupertino.dart';
import 'package:game_tv/models/response.dart';

import 'package:http/http.dart' as http;

abstract class TournamentService with ChangeNotifier {
  Future<void> fetchList();
  Tournament getItem(int i);
  int get count;
  bool get isLast;
  bool get isLoading;
  String? get error;
}

enum _Status { initial, loading, loaded, allLoaded }

class HttpTournamentService extends TournamentService {
  String cursor = '';
  String? _error;
  _Status status = _Status.initial;
  List<Tournament> t = [];
  @override
  int get count => t.length;

  HttpTournamentService() {
    fetchList();
  }

  @override
  Future<void> fetchList() async {
    if (status != _Status.loading && status != _Status.allLoaded) {
      try {
        status = _Status.loading;
        final response = await http.get(Uri.parse(
          'https://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?lmit=10&status=all&cursor=$cursor',
        ));

        final parsed = recommendationDtoFromJson(response.body);
        t.addAll(parsed.data.tournaments);
        cursor = parsed.data.cursor;
        status = _Status.loaded;
      } catch (e) {
        _error = e.toString();
      }
      notifyListeners();
    }
  }

  @override
  Tournament getItem(int i) {
    if (i >= 0 && i < count) return t[i];

    /// For debugging
    return Tournament(
        name: 'Invalid Index', coverUrl: '', gameName: 'Exception');
  }

  @override
  bool get isLast => status == _Status.allLoaded;
  @override
  bool get isLoading => status == _Status.loading;

  @override
  String? get error => _error;
}
