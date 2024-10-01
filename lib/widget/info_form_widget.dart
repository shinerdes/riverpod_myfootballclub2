import 'package:flutter/material.dart';

class InfoFormWidget extends StatelessWidget {
  const InfoFormWidget({super.key, this.form = ""});

  final String form;

  @override
  Widget build(BuildContext context) {
    print(form);
    if (form.length >= 5) {
      // 짤라하는 경우
      String result = form.substring(form.length - 5);
      List<String> parts = result.split("");

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Form ",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              for (int i = 0; i < 5; i++) ...[
                if (parts[i] == 'W')
                  Image.asset('assets/green.png',
                      width: 50, height: 50, fit: BoxFit.fill),
                if (parts[i] == 'D')
                  Image.asset('assets/grey.png',
                      width: 50, height: 50, fit: BoxFit.fill),
                if (parts[i] == 'L')
                  Image.asset('assets/red.png',
                      width: 50, height: 50, fit: BoxFit.fill),
              ]
            ],
          ),
        ),
      );
    } else {
      List<String> parts = form.split("");
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Text(
              "Form ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            for (int i = 0; i < form.length; i++) ...[
              if (parts[i] == 'W')
                Image.asset('assets/green.png',
                    width: 50, height: 50, fit: BoxFit.fill),
              if (parts[i] == 'D')
                Image.asset('assets/grey.png',
                    width: 50, height: 50, fit: BoxFit.fill),
              if (parts[i] == 'L')
                Image.asset('assets/red.png',
                    width: 50, height: 50, fit: BoxFit.fill),
            ]
          ],
        ),
      );
    }
  }
}
