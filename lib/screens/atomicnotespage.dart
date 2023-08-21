import 'package:flutter/material.dart';

import '../constants/assetsImage.dart';
import '../utilities/notecard.dart';

class AtomicNotesPage extends StatelessWidget {
  const AtomicNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Atomic Goals",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Nunito"),
              )),
        ),
       const SizedBox(
          height: 16,
        ),
        Container(
          height: 2,
          decoration:const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 178, 163, 255),
            Color.fromARGB(255, 243, 163, 255),
            Color.fromARGB(255, 255, 228, 163)
          ])),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          height: 551,
          width: 358,
          child: ListView(
            children: [
             
            ],
          ),
        )
      ],
    );
  }
}