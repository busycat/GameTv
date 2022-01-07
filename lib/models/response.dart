class Response {
  int code;
  Data data;
  bool success;

  Response({
    required this.code,
    required this.data,
    required this.success,
  });
}

class Data {
  String cursor;
  dynamic tournamentCount;
  List<Tournament> tournaments;
  bool isLastBatch;

  Data({
    required this.cursor,
    required this.tournamentCount,
    required this.tournaments,
    required this.isLastBatch,
  });
}

class Tournament {
  bool isCheckInRequired;
  String tournamentId;
  bool tournamentEnded;
  String tournamentEndDate;
  bool areRandomTeamsAllowed;
  int registeredTeams;
  String adminLocale;
  String regEndDate;
  String startDate;
  String rules;
  int maxTeams;
  String tournamentUrl;
  String prizes;
  String matchStyleType;
  String pwaUrl;
  TournamentType tournamentType;
  String geo;
  String maxLevelId;
  bool isPasswordRequired;
  String name;
  MatchStyle matchStyle;
  String registrationUrl;
  dynamic gamePkg;
  bool isRegistrationOpen;
  bool isWaitlistEnabled;
  bool incompleteTeamsAllowed;
  bool isAutoResultAllowed;
  int teamSize;
  Status status;
  bool isLevelsEnabled;
  bool indexPage;
  String dynamicAppUrl;
  String minLevelId;
  String gameFormat;
  String details;
  String gameIconUrl;
  String regStartDate;
  String coverUrl;
  dynamic bracketsUrl;
  String tournamentSlug;
  String discordUrl;
  String gameId;
  bool resultSubmissionByAdmin;
  String country;
  String adminUsername;
  String gameName;
  String streamUrl;
  int winnersCount;

  Tournament({
    required this.isCheckInRequired,
    required this.tournamentId,
    required this.tournamentEnded,
    required this.tournamentEndDate,
    required this.areRandomTeamsAllowed,
    required this.registeredTeams,
    required this.adminLocale,
    required this.regEndDate,
    required this.startDate,
    required this.rules,
    required this.maxTeams,
    required this.tournamentUrl,
    required this.prizes,
    required this.matchStyleType,
    required this.pwaUrl,
    required this.tournamentType,
    required this.geo,
    required this.maxLevelId,
    required this.isPasswordRequired,
    required this.name,
    required this.matchStyle,
    required this.registrationUrl,
    required this.gamePkg,
    required this.isRegistrationOpen,
    required this.isWaitlistEnabled,
    required this.incompleteTeamsAllowed,
    required this.isAutoResultAllowed,
    required this.teamSize,
    required this.status,
    required this.isLevelsEnabled,
    required this.indexPage,
    required this.dynamicAppUrl,
    required this.minLevelId,
    required this.gameFormat,
    required this.details,
    required this.gameIconUrl,
    required this.regStartDate,
    required this.coverUrl,
    required this.bracketsUrl,
    required this.tournamentSlug,
    required this.discordUrl,
    required this.gameId,
    required this.resultSubmissionByAdmin,
    required this.country,
    required this.adminUsername,
    required this.gameName,
    required this.streamUrl,
    required this.winnersCount,
  });
}

enum MatchStyle { LOBBY, BRACKETS }

enum Status { PUBLISHED }

enum TournamentType { DISCORD, WEB, APP }
