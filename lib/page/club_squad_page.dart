import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_myfootballclub2/constant.dart';
import 'package:riverpod_myfootballclub2/data/footballclub_data.dart';
import 'package:riverpod_myfootballclub2/model/squad_model.dart';
import 'package:riverpod_myfootballclub2/provider/club_provider.dart';

class ClubSquadPage extends ConsumerStatefulWidget {
  const ClubSquadPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ClubSquadPageState();
}

class _ClubSquadPageState extends ConsumerState<ClubSquadPage> {
  @override
  Widget build(BuildContext context) {
    final clubIndex = ref.watch(clubIndexProvider); // 클럽 인덱스
    final id = footballClubList[clubIndex]['id'];
    final squad = ref.watch(squadFutureProvider(id!));

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
            'Team Squads',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // launchUrl(Uri.parse(footballClubLinkList[
                  //     Provider.of<PickClub>(context, listen: false)
                  //         .selectIndex]['detailSquads']!));
                },
                icon: const Icon(Icons.people_outline_outlined))
          ], // pl link
        ),
        body: Center(
          child: squad.when(
            data: (data) => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 6,
                childAspectRatio: 3 / 4,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      side: const BorderSide(width: 3.0)),
                  margin: const EdgeInsets.all(8),
                  //elevation: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: _squadsBackgroundColor(data[index].position),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: GridTile(
                      header: Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                        child: Text(
                          "No.${data[index].number.toString()}",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ), // 번호 + 포지션 // 넘버
                      footer: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: AutoSizeText(
                          data[index].name,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ), // 번호 + 포지션

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          data[index].photo,
                          alignment: Alignment.center,
                        ),
                      ),
                    ), // 선수 사진
                  ),
                ),
              ),
            ),
            error: (e, stackTrace) => Text(
              'Error: ${e.toString()}',
              style: const TextStyle(fontSize: 15),
            ),
            loading: () => const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

Future<bool> _onBackPressed(BuildContext context) async {
  Navigator.pop(context, false);
  return true;
}

_squadsBackgroundColor(String position) {
  switch (position) {
    case "Goalkeeper":
      return const Color.fromRGBO(237, 177, 70, 1);
    case "Defender":
      return const Color.fromRGBO(34, 100, 234, 1);
    case "Midfielder":
      return const Color.fromRGBO(28, 204, 121, 1);
    case "Attacker":
      return const Color.fromRGBO(240, 39, 77, 1);
    default:
      return const Color.fromRGBO(255, 255, 255, 0);
  }
}

final squadFutureProvider =
    FutureProvider.family<List<Squad>, String>((ref, id) async {
  await Future.delayed(const Duration(seconds: 1));
  var playersCount = 0;

  Squad clubSQ =
      const Squad(name: "", age: 0, number: 0, position: "", photo: "", id: 0);

  List<Squad> st = [];

  var request = http.Request(
      'GET',
      Uri.parse(
          'https://api-football-v1.p.rapidapi.com/v3/players/squads?team=$id'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  print(response.statusCode);

  if (response.statusCode == 200) {
    //print(await response.stream.bytesToString());

    var beforeData = await response.stream.bytesToString();
    //var json1 = json.decode(beforeData)["response"];
    var json2 = json.decode(beforeData)["response"][0]["players"];

    playersCount =
        (json.decode(beforeData)["response"][0]["players"] as List<dynamic>)
            .length;

    for (int i = 0; i < playersCount; i++) {
      print(json2[i]);
      clubSQ = Squad(
          id: json2[i]["id"] ?? 0,
          name: json2[i]["name"],
          age: json2[i]["age"] ?? 0,
          number: json2[i]["number"] ?? 0,
          position: json2[i]["position"],
          photo: json2[i]["photo"] ?? "");

      st.add(clubSQ);
    }
    // 포지션별로 분할

    return st;
  } else {
    return st;
  }
});
