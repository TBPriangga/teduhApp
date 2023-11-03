import 'package:flutter/material.dart';
import 'package:teduh_app/screen/home_screen.dart';
import 'package:teduh_app/screen/note/home_note_screen.dart';
import 'package:teduh_app/screen/renungan/renungan_screen.dart';
import 'package:teduh_app/screen/youtube/home_youtube_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(100),
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(left: 50),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              icon: const Icon(Icons.home),
            ),
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, renunganScreen.routeName);
            },
            icon: const Icon(Icons.book),
          ),
          label: "Renungan",
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, HomeYoutubeScreen.routeName);
            },
            icon: const Icon(Icons.video_collection),
          ),
          label: "Youtube",
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(right: 50),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, noteHomeScreen.routeName);
              },
              icon: const Icon(Icons.note_add),
            ),
          ),
          label: "Notes",
        ),
      ],
    );
  }
}
