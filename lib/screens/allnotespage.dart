import 'package:flutter/material.dart';

import '../constants/assetsImage.dart';
import '../utilities/notecard.dart';

class AllNotesPage extends StatelessWidget {
  const AllNotesPage({super.key});

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
                "Genie Notes",
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
              MyNoteCard(
                imagePath: AssetImages.violcard,
                isStarred: true,
                hasCheck: true,
                noteTitle: "Tori maka buuu 😝",
                localAudPath: "sdfsdf",
                transcribedText:
                    "tum gaand matt chalao maa chod denge tumhari bkl maaiya utha k le jayenge tumhari behn k lund saale jhaat barabar aukaat h tumhari randi k bacche jhaatu saale itta marroonga na apne lund s ki tumhari 7 pushte yaad rakheni chudai chudakkad randi saali behn ki chut teri 😘🖕",
                date: "2023-07-06 09:33:21.011483",
                cardId: "0",
              ),
              MyNoteCard(
                imagePath: AssetImages.violcard,
                isStarred: true,
                hasCheck: true,
                noteTitle: "Tori maka buuu 😝",
                localAudPath: "sdfsdf",
                transcribedText:
                    "tum gaand matt chalao maa chod denge tumhari bkl maaiya utha k le jayenge tumhari behn k lund saale jhaat barabar aukaat h tumhari randi k bacche jhaatu saale itta marroonga na apne lund s ki tumhari 7 pushte yaad rakheni chudai chudakkad randi saali behn ki chut teri 😘🖕",
                date: "2023-07-06 09:33:23.011482",
                cardId: "1",
              ),
              MyNoteCard(
                imagePath: AssetImages.violcard,
                isStarred: true,
                hasCheck: true,
                noteTitle: "Tori maka buuu 😝",
                localAudPath: "sdfsdf",
                transcribedText:
                    "tum gaand matt chalao maa chod denge tumhari bkl maaiya utha k le jayenge tumhari behn k lund saale jhaat barabar aukaat h tumhari randi k bacche jhaatu saale itta marroonga na apne lund s ki tumhari 7 pushte yaad rakheni chudai chudakkad randi saali behn ki chut teri 😘🖕",
                date: "2023-07-04 09:33:22.011484",
                cardId: "2",
              ),
              MyNoteCard(
                imagePath: AssetImages.violcard,
                isStarred: true,
                hasCheck: true,
                noteTitle: "Tori maka buuu 😝",
                localAudPath: "sdfsdf",
                transcribedText:
                    "tum gaand matt chalao maa chod denge tumhari bkl maaiya utha k le jayenge tumhari behn k lund saale jhaat barabar aukaat h tumhari randi k bacche jhaatu saale itta marroonga na apne lund s ki tumhari 7 pushte yaad rakheni chudai chudakkad randi saali behn ki chut teri 😘🖕",
                date: "2023-07-03 09:33:24.011485",
                cardId: "3",
              ),
              MyNoteCard(
                imagePath: AssetImages.violcard,
                isStarred: true,
                hasCheck: true,
                noteTitle: "Tori maka buuu 😝",
                localAudPath: "sdfsdf",
                transcribedText:
                    "tum gaand matt chalao maa chod denge tumhari bkl maaiya utha k le jayenge tumhari behn k lund saale jhaat barabar aukaat h tumhari randi k bacche jhaatu saale itta marroonga na apne lund s ki tumhari 7 pushte yaad rakheni chudai chudakkad randi saali behn ki chut teri 😘🖕",
                date: "2023-07-02 09:33:20.011487",
                cardId: "4",
              ),
              MyNoteCard(
                imagePath: AssetImages.violcard,
                isStarred: true,
                hasCheck: true,
                noteTitle: "Tori maka buuu 😝",
                localAudPath: "sdfsdf",
                transcribedText:
                    "tum gaand matt chalao maa chod denge tumhari bkl maaiya utha k le jayenge tumhari behn k lund saale jhaat barabar aukaat h tumhari randi k bacche jhaatu saale itta marroonga na apne lund s ki tumhari 7 pushte yaad rakheni chudai chudakkad randi saali behn ki chut teri 😘🖕",
                date: "2023-07-01 09:33:29.011481",
                cardId: "5",
              ),
            ],
          ),
        )
      ],
    );
  }
}
