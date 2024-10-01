import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class InfoTitleCard extends StatelessWidget {
  const InfoTitleCard({
    super.key,
    this.clubImage = "clubImage",
    this.clubName = "clubName",
  });

  final String clubImage;
  final String clubName;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              clubImage,
                              width: 90,
                              height: 90,
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: AutoSizeText(
                                clubName
                                    .split('')
                                    .join('\ufeff')
                                    .replaceAll('\ufeff \ufeff', ' '),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
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
