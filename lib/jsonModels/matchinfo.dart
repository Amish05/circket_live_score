class matchinfo {
  String? apikey;
  Data? data;
  String? status;
  Info? info;

  matchinfo({this.apikey, this.data, this.status, this.info});

  matchinfo.fromJson(Map<String, dynamic> json) {
    apikey = json['apikey'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apikey'] = this.apikey;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? matchType;
  String? status;
  String? venue;
  String? date;
  String? dateTimeGMT;
  List<String>? teams;
  List<TeamInfo>? teamInfo;
  List<Score>? score;
  String? tossWinner;
  String? tossChoice;
  String? matchWinner;
  String? seriesId;
  bool? fantasyEnabled;
  bool? bbbEnabled;
  bool? hasSquad;
  bool? matchStarted;
  bool? matchEnded;

  Data(
      {this.id,
      this.name,
      this.matchType,
      this.status,
      this.venue,
      this.date,
      this.dateTimeGMT,
      this.teams,
      this.teamInfo,
      this.score,
      this.tossWinner,
      this.tossChoice,
      this.matchWinner,
      this.seriesId,
      this.fantasyEnabled,
      this.bbbEnabled,
      this.hasSquad,
      this.matchStarted,
      this.matchEnded});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    matchType = json['matchType'];
    status = json['status'];
    venue = json['venue'];
    date = json['date'];
    dateTimeGMT = json['dateTimeGMT'];
    teams = json['teams'].cast<String>();
    if (json['teamInfo'] != null) {
      teamInfo = <TeamInfo>[];
      json['teamInfo'].forEach((v) {
        teamInfo!.add(new TeamInfo.fromJson(v));
      });
    }
    if (json['score'] != null) {
      score = <Score>[];
      json['score'].forEach((v) {
        score!.add(new Score.fromJson(v));
      });
    }
    tossWinner = json['tossWinner'];
    tossChoice = json['tossChoice'];
    matchWinner = json['matchWinner'];
    seriesId = json['series_id'];
    fantasyEnabled = json['fantasyEnabled'];
    bbbEnabled = json['bbbEnabled'];
    hasSquad = json['hasSquad'];
    matchStarted = json['matchStarted'];
    matchEnded = json['matchEnded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['matchType'] = this.matchType;
    data['status'] = this.status;
    data['venue'] = this.venue;
    data['date'] = this.date;
    data['dateTimeGMT'] = this.dateTimeGMT;
    data['teams'] = this.teams;
    if (this.teamInfo != null) {
      data['teamInfo'] = this.teamInfo!.map((v) => v.toJson()).toList();
    }
    if (this.score != null) {
      data['score'] = this.score!.map((v) => v.toJson()).toList();
    }
    data['tossWinner'] = this.tossWinner;
    data['tossChoice'] = this.tossChoice;
    data['matchWinner'] = this.matchWinner;
    data['series_id'] = this.seriesId;
    data['fantasyEnabled'] = this.fantasyEnabled;
    data['bbbEnabled'] = this.bbbEnabled;
    data['hasSquad'] = this.hasSquad;
    data['matchStarted'] = this.matchStarted;
    data['matchEnded'] = this.matchEnded;
    return data;
  }
}

class TeamInfo {
  String? name;
  String? shortname;
  String? img;

  TeamInfo({this.name, this.shortname, this.img});

  TeamInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shortname = json['shortname'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['shortname'] = this.shortname;
    data['img'] = this.img;
    return data;
  }
}

class Score {
  double? r;
  double? w;
  double? o;
  String? inning;

  Score({this.r, this.w, this.o, this.inning});

  Score.fromJson(Map<String, dynamic> json) {
    r = json['r'];
    w = json['w'];
    o = json['o'];
    inning = json['inning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['r'] = this.r;
    data['w'] = this.w;
    data['o'] = this.o;
    data['inning'] = this.inning;
    return data;
  }
}

class Info {
  double? hitsToday;
  double? hitsUsed;
  double? hitsLimit;
  double? credits;
  double? server;
  double? queryTime;
  double? s;
  double? cache;

  Info(
      {this.hitsToday,
      this.hitsUsed,
      this.hitsLimit,
      this.credits,
      this.server,
      this.queryTime,
      this.s,
      this.cache});

  Info.fromJson(Map<String, dynamic> json) {
    hitsToday = json['hitsToday'];
    hitsUsed = json['hitsUsed'];
    hitsLimit = json['hitsLimit'];
    credits = json['credits'];
    server = json['server'];
    queryTime = json['queryTime'];
    s = json['s'];
    cache = json['cache'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hitsToday'] = this.hitsToday;
    data['hitsUsed'] = this.hitsUsed;
    data['hitsLimit'] = this.hitsLimit;
    data['credits'] = this.credits;
    data['server'] = this.server;
    data['queryTime'] = this.queryTime;
    data['s'] = this.s;
    data['cache'] = this.cache;
    return data;
  }
}
