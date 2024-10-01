import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_myfootballclub2/data/footballclub_data.dart';
import 'package:riverpod_myfootballclub2/provider/club_provider.dart';
import 'package:riverpod_myfootballclub2/provider/theme_provider.dart';
import 'package:riverpod_myfootballclub2/widget/home_menu_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ClubHomePage extends ConsumerWidget {
  const ClubHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);
    final clubIndex = ref.watch(clubIndexProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                ref.read(isDarkProvider.notifier).toggleTheme();
              },
              icon: const Icon(Icons.dark_mode)),
          IconButton(
            onPressed: () async {
              context.push("/setting");
            },
            icon: const Icon(
              Icons.change_circle_outlined,
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            const Divider(
              height: 10,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(
              height: 254,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                            'assets/${footballClubList[clubIndex]['clubimage']!}.png',
                            width: 85,
                            height: 85,
                            fit: BoxFit.fill),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          footballClubList[clubIndex]['clubname']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              launchUrl(Uri.parse(
                                  footballClubLinkList[clubIndex]
                                      ['instagram']!));
                            },
                            icon: SvgPicture.asset(
                              'assets/instagram-brands-solid.svg',
                              width: 50,
                              height: 50,
                              colorFilter: isDark
                                  ? const ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn)
                                  : const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn),
                            ),
                            iconSize: 50,
                          ),
                          IconButton(
                            onPressed: () {
                              launchUrl(Uri.parse(
                                  footballClubLinkList[clubIndex]['twitter']!));
                            },
                            icon: SvgPicture.asset(
                              'assets/twitter-brands-solid.svg',
                              width: 50,
                              height: 50,
                              colorFilter: isDark
                                  ? const ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn)
                                  : const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn),
                            ),
                            iconSize: 50,
                          ),
                          IconButton(
                            onPressed: () {
                              launchUrl(Uri.parse(
                                  footballClubLinkList[clubIndex]['youtube']!));
                            },
                            icon: SvgPicture.asset(
                              'assets/youtube-brands-solid.svg',
                              width: 50,
                              height: 50,
                              colorFilter: isDark
                                  ? const ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn)
                                  : const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn),
                            ),
                            iconSize: 50,
                          ),
                          IconButton(
                            onPressed: () {
                              launchUrl(Uri.parse(
                                  footballClubLinkList[clubIndex]
                                      ['homepage']!));
                            },
                            icon: SvgPicture.asset(
                              'assets/chrome-brands-solid.svg',
                              width: 50,
                              height: 50,
                              colorFilter: isDark
                                  ? const ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn)
                                  : const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn),
                            ),
                            iconSize: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              indent: 10,
              endIndent: 10,
              //color: Colors.black,
            ),
            Column(
              children: [
                HomeMenuWidget(
                    svgPicture: SvgPicture.asset(
                      'assets/info-solid.svg',
                      width: 50,
                      height: 50,
                      colorFilter: isDark
                          ? const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn)
                          : const ColorFilter.mode(
                              Colors.black, BlendMode.srcIn),
                    ),
                    title: 'Team Info'),
                HomeMenuWidget(
                    svgPicture: SvgPicture.asset(
                      'assets/users-solid.svg',
                      width: 50,
                      height: 50,
                      colorFilter: isDark
                          ? const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn)
                          : const ColorFilter.mode(
                              Colors.black, BlendMode.srcIn),
                    ),
                    title: 'Team Squad'),
                HomeMenuWidget(
                    svgPicture: SvgPicture.asset(
                      'assets/chart-line-solid.svg',
                      width: 50,
                      height: 50,
                      colorFilter: isDark
                          ? const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn)
                          : const ColorFilter.mode(
                              Colors.black, BlendMode.srcIn),
                    ),
                    title: 'Standing'),
                const Divider(
                  height: 10,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                  //color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
