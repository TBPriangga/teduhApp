import 'package:flutter/material.dart';
import 'package:teduh_app/screen/renungan/bacaan_screen.dart';
import 'package:teduh_app/screen/renungan/renungan_screen.dart';
import 'screen/home_screen.dart';
import 'screen/note/add_note_screen.dart';
import 'screen/note/display_note_screen.dart';
import 'screen/note/home_note_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        noteHomeScreen.routeName: (context) => const noteHomeScreen(),
        AddNote.routeName: (context) => const AddNote(),
        ShowNote.routeName: (context) => const ShowNote(),
        renunganScreen.routeName: (context) => const renunganScreen(),
        bacaanScreen.routeName: (context) => const bacaanScreen(),
      },
    );
  }
}
