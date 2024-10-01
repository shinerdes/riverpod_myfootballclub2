import 'package:flutter/material.dart';

class InfoPlayedGoalWidget extends StatelessWidget {
  const InfoPlayedGoalWidget({
    super.key,
    this.played = "played",
    this.win = "win",
    this.draw = "draw",
    this.lose = "lose",
    this.goals = "goals",
    this.forGoals = "forGoals",
    this.againstGoals = "againstGoals",
  });

  final String played;
  final String win;
  final String draw;
  final String lose;
  final String goals;
  final String forGoals;
  final String againstGoals;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.flag_circle_outlined,
                              size: 35,
                            ),
                            Text(
                              "$played Played",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$win Win ",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const Text("  /  "),
                            Text(
                              "$draw Draw ",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const Text("  /  "),
                            Flexible(
                              child: Text(
                                "$lose Lose ",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.sports_soccer_outlined,
                              size: 35,
                            ),
                            Text(
                              "$goals Goal Difference",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$forGoals Score",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const Text("  /  "),
                            Flexible(
                              child: Text(
                                "$againstGoals Conceded",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
