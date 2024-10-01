import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_myfootballclub2/constant.dart';
import 'package:riverpod_myfootballclub2/data/footballclub_data.dart';
import 'package:riverpod_myfootballclub2/model/info_model.dart';
import 'package:riverpod_myfootballclub2/provider/club_provider.dart';
import 'package:riverpod_myfootballclub2/widget/info_form_widget.dart';
import 'package:riverpod_myfootballclub2/widget/info_played_goal_widget.dart';
import 'package:riverpod_myfootballclub2/widget/info_title_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ClubInfoPage extends ConsumerStatefulWidget {
  const ClubInfoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ClubInfoPageState();
}

class _ClubInfoPageState extends ConsumerState<ClubInfoPage> {
  @override
  Widget build(BuildContext context) {
    final clubIndex = ref.watch(clubIndexProvider); // 클럽 인덱스
    final id = footballClubList[clubIndex]['id'];
    final standing = ref.watch(standingFutureProvider(id!));

    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        _onBackPressed(context);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,

          title: const Text(
            'Team Info',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  launchUrl(Uri.parse(
                      footballClubLinkList[clubIndex]['detailInfo']!));
                },
                icon: const Icon(Icons.info)),
          ], // pl link
        ),
        body: SafeArea(
          bottom: true,
          child: Center(
            child: standing.when(
              data: (data) => Column(
                children: [
                  const Divider(
                    height: 10,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  InfoTitleCard(
                    clubImage: data.logo.toString(),
                    clubName: data.name.toString(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InfoFormWidget(
                    form: data.recentFive.toString(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InfoPlayedGoalWidget(
                    played: data.played.toString(),
                    win: data.win.toString(),
                    draw: data.draw.toString(),
                    lose: data.lose.toString(),
                    goals: data.goals.toString(),
                    forGoals: data.forGoals.toString(),
                    againstGoals: data.againstGoals.toString(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                ],
              ),
              error: (e, stackTrace) => Text(
                'Error: ${e.toString()}',
                style: const TextStyle(fontSize: 15),
              ),
              loading: () => const CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}

final standingFutureProvider =
    FutureProvider.family<ClubInfomation, String>((ref, id) async {
  await Future.delayed(const Duration(seconds: 1));

  ClubInfomation clubInfomation = const ClubInfomation(
      name: '',
      logo: '',
      league: '',
      recentFive: '',
      played: 0,
      win: 0,
      draw: 0,
      lose: 0,
      goals: 0,
      forGoals: 0,
      againstGoals: 0,
      cleanSheet: 0,
      failedToScore: 0,
      bestFormation: '',
      bestFormationplay: 0);

  var request = http.Request(
      'GET',
      Uri.parse(
          'https://api-football-v1.p.rapidapi.com/v3/teams/statistics?league=39&team=$id&season=2023'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var beforeData = await response.stream.bytesToString();
    print(beforeData);

    // var json1 = json.decode(beforeData)["response"];

    // var json2 = json.decode(beforeData)["response"]["league"];

    // var json3 = json.decode(beforeData)["response"]["team"];

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

    return clubInfomation;
  } else {
    return clubInfomation;
  }
});

Future<bool> _onBackPressed(BuildContext context) async {
  Navigator.pop(context, false);
  return true;
}
