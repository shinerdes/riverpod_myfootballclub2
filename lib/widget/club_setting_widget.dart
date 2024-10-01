import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_myfootballclub2/provider/club_provider.dart';

class ClubSettingWidget extends ConsumerWidget {
  const ClubSettingWidget(
      {super.key,
      required this.clubname,
      required this.clubimage,
      required this.index});

  final String clubname;
  final String clubimage;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clubIndex = ref.watch(clubIndexProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade800,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/$clubimage.png',
                    width: 35, height: 35, fit: BoxFit.fill),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  clubname,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Material(
              color: Colors.blue,
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              child: InkWell(
                onTap: () async {
                  // print('siuu');

                  // setIndex(widget.index);

                  // ref
                  //     .read(clubsProvider.notifier)
                  //     .changeClub(Club(index: widget.index));
                  // //context.replace("/home");

                  ref.read(clubIndexProvider.notifier).changeIndex(index);
                  context.pop();
                },
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
                child: Container(
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade700,
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      '선택',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
