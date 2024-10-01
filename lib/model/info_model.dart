class ClubInfomation {
  const ClubInfomation({
    required this.name,
    required this.logo,
    required this.league,
    required this.recentFive,
    required this.played,
    required this.win,
    required this.draw,
    required this.lose,
    required this.goals,
    required this.forGoals,
    required this.againstGoals,
    required this.cleanSheet,
    required this.failedToScore,
    required this.bestFormation,
    required this.bestFormationplay,
  });

  final String name;

  final String logo;
  final String league;

  final String recentFive;

  final int played;
  final int win;
  final int draw;
  final int lose;

  final int goals;
  final int forGoals;
  final int againstGoals;

  final int cleanSheet;
  final int failedToScore;

  final String bestFormation;
  final int bestFormationplay;

  factory ClubInfomation.fromJson(Map<String, dynamic> json) {
    return ClubInfomation(
        name: json["response"]["team"]["name"],
        logo: json["response"]["team"]["logo"],
        league: json["response"]["league"]["logo"],
        recentFive: json["response"]["form"],
        played: json["response"]["fixtures"]["played"]["total"],
        win: json["response"]["fixtures"]["wins"]["total"],
        draw: json["response"]["fixtures"]["draws"]["total"],
        lose: json["response"]["fixtures"]["loses"]["total"],
        goals: json["response"]["goals"]["for"]["total"]["total"] -
            json["response"]["goals"]["against"]["total"]["total"],
        forGoals: json["response"]["goals"]["for"]["total"]["total"],
        againstGoals: json["response"]["goals"]["against"]["total"]["total"],
        cleanSheet: json["response"]["clean_sheet"]["total"],
        failedToScore: json["response"]["failed_to_score"]["total"],
        bestFormation: json["response"]["lineups"][0]["formation"],
        bestFormationplay: json["response"]["lineups"][0]["played"]);
  }

  /*
 clubInfomation = ClubInfomation(
        name: json.decode(beforeData)["response"]["team"]["name"],
        logo: json.decode(beforeData)["response"]["team"]["logo"],
        league: json.decode(beforeData)["response"]["league"]["logo"],
        recentFive: json.decode(beforeData)["response"]["form"],
        played: json.decode(beforeData)["response"]["fixtures"]["played"]
            ["total"],
        win: json.decode(beforeData)["response"]["fixtures"]["wins"]["total"],
        draw: json.decode(beforeData)["response"]["fixtures"]["draws"]["total"],
        lose: json.decode(beforeData)["response"]["fixtures"]["loses"]["total"],
        goals: json.decode(beforeData)["response"]["goals"]["for"]["total"]
                ["total"] -
            json.decode(beforeData)["response"]["goals"]["against"]["total"]
                ["total"],
        forGoals: json.decode(beforeData)["response"]["goals"]["for"]["total"]
            ["total"],
        againstGoals: json.decode(beforeData)["response"]["goals"]["against"]
            ["total"]["total"],
        cleanSheet: json.decode(beforeData)["response"]["clean_sheet"]["total"],
        failedToScore: json.decode(beforeData)["response"]["failed_to_score"]
            ["total"],
        bestFormation: json.decode(beforeData)["response"]["lineups"][0]
            ["formation"],
        bestFormationplay: json.decode(beforeData)["response"]["lineups"][0]
            ["played"],
      );
  */
}
