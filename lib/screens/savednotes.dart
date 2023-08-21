import 'package:flutter/material.dart';
import 'package:notegenierecreated/utilities/atomicnotescard.dart';

class MySavedNotesPage extends StatelessWidget {
  const MySavedNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      const  SizedBox(
          height: 16 ,
        ),
      const  Padding(
          padding:  EdgeInsets.only(left: 16.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Saved",
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
        SizedBox(
          height: 551,
          width: 358,
          child: ListView(
            children: const[
             AtomicNoteCard(isStarred: true, hasCheck: true, noteTitle: "Bas Bhai", localAudPath: "", transcribedText: "Chup reh bsdk", date: "2023-07-04 09:33:22.011484",  cardId: "2")
            ],
          ),
        )
      ],
    );
  }
}