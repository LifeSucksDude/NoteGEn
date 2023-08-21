import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notegenierecreated/features/authenticaton/views/emailsign.dart';
import 'package:notegenierecreated/features/genienotes/view/notegeniepage.dart';
import 'package:notegenierecreated/screens/homeview.dart';
import 'package:notegenierecreated/spashandonboar/difsigin.dart';
import 'package:notegenierecreated/widgetforapp/playit.dart';

import 'firebase_options.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ProviderScope(child:  Opener()));
}

class Opener extends StatelessWidget {
  const Opener({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NoteGenie',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      home: HomeView()
    );
  }
}

