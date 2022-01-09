import 'dart:convert';

RecommendationDto recommendationDtoFromJson(String str) =>
    RecommendationDto.fromJson(json.decode(str));

class RecommendationDto {
  RecommendationDto({
    required this.code,
    required this.data,
    required this.success,
  });

  int code;
  Data data;
  bool success;

  factory RecommendationDto.fromJson(Map<String, dynamic> json) =>
      RecommendationDto(
        code: json['code'] as int,
        data: Data.fromJson(json['data']),
        success: json['success'],
      );
}

class Data {
  Data({
    required this.cursor,
    required this.tournamentCount,
    required this.tournaments,
    required this.isLastBatch,
  });

  String cursor;
  dynamic tournamentCount;
  List<Tournament> tournaments;
  bool isLastBatch;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cursor: json['cursor'] as String,
        tournamentCount: json['tournament_count'],
        tournaments: List<Tournament>.from(json['tournaments'].map(
            (dynamic x) => Tournament.fromJson(x as Map<String, dynamic>))),
        isLastBatch: json['is_last_batch'],
      );
}

class Tournament {
  Tournament({
    required this.isCheckInRequired,
    required this.tournamentId,
    // required this.tournamentEnded,
    // required this.tournamentEndDate,
    // required this.areRandomTeamsAllowed,
    // required this.registeredTeams,
    // required this.adminLocale,
    // required this.regEndDate,
    // required this.startDate,
    // required this.rules,
    // required this.maxTeams,
    // required this.tournamentUrl,
    // required this.prizes,
    // required this.matchStyleType,
    // required this.pwaUrl,
    // required this.tournamentType,
    // required this.geo,
    // required this.maxLevelId,
    // required this.isPasswordRequired,
    // required this.name,
    // required this.matchStyle,
    // required this.registrationUrl,
    // required this.gamePkg,
    // required this.isRegistrationOpen,
    // required this.isWaitlistEnabled,
    // required this.incompleteTeamsAllowed,
    // required this.isAutoResultAllowed,
    // required this.teamSize,
    // required this.status,
    // required this.isLevelsEnabled,
    // required this.indexPage,
    // required this.dynamicAppUrl,
    // required this.minLevelId,
    // required this.gameFormat,
    // required this.details,
    // required this.gameIconUrl,
    // required this.regStartDate,
    required this.coverUrl,
    // required this.bracketsUrl,
    // required this.tournamentSlug,
    // required this.discordUrl,
    // required this.gameId,
    // required this.resultSubmissionByAdmin,
    // required this.country,
    // required this.adminUsername,
    // required this.gameName,
    // required this.streamUrl,
    // required this.winnersCount,
  });

  bool isCheckInRequired;
  String tournamentId;
  // bool tournamentEnded;
  // String tournamentEndDate;
  // bool areRandomTeamsAllowed;
  // int? registeredTeams;
  // String adminLocale;
  // String regEndDate;
  // String startDate;
  // String rules;
  // int maxTeams;
  // String tournamentUrl;
  // String prizes;
  // String matchStyleType;
  // String pwaUrl;
  // TournamentType tournamentType;
  // String geo;
  // String? maxLevelId;
  // bool isPasswordRequired;
  // String name;
  // MatchStyle matchStyle;
  // String registrationUrl;
  // dynamic gamePkg;
  // bool isRegistrationOpen;
  // bool isWaitlistEnabled;
  // bool incompleteTeamsAllowed;
  // bool isAutoResultAllowed;
  // int teamSize;
  // Status status;
  // bool isLevelsEnabled;
  // bool indexPage;
  // String dynamicAppUrl;
  // String? minLevelId;
  // String gameFormat;
  // String details;
  // String gameIconUrl;
  // String regStartDate;
  String coverUrl;
  // dynamic bracketsUrl;
  // String tournamentSlug;
  // String discordUrl;
  // String gameId;
  // bool resultSubmissionByAdmin;
  // String country;
  // String adminUsername;
  // String gameName;
  // String streamUrl;
  // int winnersCount;

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        isCheckInRequired: json['is_check_in_required'],
        tournamentId: json['tournament_id'],
        // tournamentEnded: json['tournament_ended'],
        // tournamentEndDate: json['tournament_end_date'],
        // areRandomTeamsAllowed: json['are_random_teams_allowed'],
        // registeredTeams: json['registered_teams'] ?? 0,
        // adminLocale: json['admin_locale'],
        // regEndDate: json['reg_end_date'],
        // startDate: json['start_date'],
        // rules: json['rules'],
        // maxTeams: json['max_teams'],
        // tournamentUrl: json['tournament_url'],
        // prizes: json['prizes'],
        // matchStyleType: json['match_style_type'],
        // pwaUrl: json['pwa_url'] ?? '',
        // tournamentType: tournamentTypeValues.map[json['tournament_type']],
        // geo: json['geo'],
        // maxLevelId: json['max_level_id'] ?? '',
        // isPasswordRequired: json['is_password_required'],
        // name: json['name'],
        // matchStyle: matchStyleValues.map[json['match_style']],
        // registrationUrl: json['registration_url'],
        // gamePkg: json['game_pkg'],
        // isRegistrationOpen: json['is_registration_open'],
        // isWaitlistEnabled: json['is_waitlist_enabled'],
        // incompleteTeamsAllowed: json['incomplete_teams_allowed'],
        // isAutoResultAllowed: json['is_auto_result_allowed'],
        // teamSize: json['team_size'],
        // status: statusValues.map[json['status']],
        // isLevelsEnabled: json['is_levels_enabled'],
        // indexPage: json['index_page'],
        // dynamicAppUrl: json['dynamic_app_url'],
        // minLevelId: json['min_level_id'] ?? '',
        // gameFormat: json['game_format'],
        // details: json['details'],
        // gameIconUrl: json['game_icon_url'],
        // regStartDate: json['reg_start_date'],
        coverUrl: json['cover_url'],
        // bracketsUrl: json['brackets_url'],
        // tournamentSlug: json['tournament_slug'],
        // discordUrl: json['discord_url'],
        // gameId: json['game_id'],
        // resultSubmissionByAdmin: json['result_submission_by_admin'],
        // country: json['country'],
        // adminUsername: json['admin_username'],
        // gameName: json['game_name'],
        // streamUrl: json['stream_url'],
        // winnersCount: json['winners_count'] ?? 0,
      );
}

enum MatchStyle { lobby, brackets }

final matchStyleValues =
    EnumValues({'brackets': MatchStyle.brackets, 'lobby': MatchStyle.lobby});

enum Status { published }

final statusValues = EnumValues({'published': Status.published});

enum TournamentType { discord, web, app }

final tournamentTypeValues = EnumValues({
  'app': TournamentType.app,
  'discord': TournamentType.discord,
  'web': TournamentType.web
});

class EnumValues<T> {
  final Map<String, T> map;
  late Map<T, String>? _reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    _reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return _reverseMap!;
  }
}
