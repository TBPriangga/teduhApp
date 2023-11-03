import 'package:flutter/material.dart';
import 'package:teduh_app/model/note_model.dart';

import '../../db/database.dart';
import 'add_note_screen.dart';

class ShowNote extends StatelessWidget {
  const ShowNote({Key? key}) : super(key: key);

  static const routeName = '/ShowNote';
  @override
  Widget build(BuildContext context) {
    final NoteModel note =
        ModalRoute.of(context)!.settings.arguments as NoteModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNote(
                    note: note,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              dbDatabase.db.deleteNote(note.id);
              Navigator.pushNamedAndRemoveUntil(
                  context, "/notehomescreen", (route) => false);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              note.title,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              note.body,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
