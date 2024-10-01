import 'package:flutter/material.dart';
import 'package:riverpod_myfootballclub2/data/footballclub_data.dart';
import 'package:riverpod_myfootballclub2/widget/club_setting_widget.dart';

class ClubSettingsPage extends StatefulWidget {
  const ClubSettingsPage({super.key});

  @override
  State<ClubSettingsPage> createState() => _ClubSettingsPageState();
}

class _ClubSettingsPageState extends State<ClubSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pick Your Club",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: footballClubList.length,
            itemBuilder: (context, index) {
              return ClubSettingWidget(
                clubname: footballClubList[index]['clubname']!,
                clubimage: footballClubList[index]['clubimage']!,
                index: index,
              );

              // widget
            }),
      ),
    );
  }
}
