import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_myfootballclub2/page/club_home_page.dart';
import 'package:riverpod_myfootballclub2/page/club_info_page.dart';
import 'package:riverpod_myfootballclub2/page/club_setting_page.dart';
import 'package:riverpod_myfootballclub2/page/club_squad_page.dart';
import 'package:riverpod_myfootballclub2/page/club_standing_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: "/home",
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        return const ClubHomePage();
      },
    ),
    GoRoute(
      path: "/setting",
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        return const ClubSettingsPage();
      },
    ),
    GoRoute(
      path: "/standing",
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        return const ClubStandingPage();
      },
    ),
    GoRoute(
      path: "/info",
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        return const ClubInfoPage();
      },
    ),
    GoRoute(
      path: "/squad",
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        return const ClubSquadPage();
      },
    ),
  ],
);
