class StandingInfo {
  const StandingInfo({
    required this.rank,
    required this.logo,
    required this.name,
    required this.played,
    required this.points,
    required this.goalsDiff,
  });

  final int rank;
  final String logo;
  final String name;
  final int played;
  final int points;
  final int goalsDiff;
}
