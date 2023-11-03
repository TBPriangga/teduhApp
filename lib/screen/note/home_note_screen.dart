// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:teduh_app/screen/note/add_note_screen.dart';
import 'package:teduh_app/screen/note/display_note_screen.dart';

import '../../db/database.dart';
import '../../model/note_model.dart';

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

class noteHomeScreen extends StatefulWidget {
  const noteHomeScreen({Key? key}) : super(key: key);

  static const routeName = '/notehomescreen';
  @override
  State<noteHomeScreen> createState() => _noteHomeScreenState();
}

class _noteHomeScreenState extends State<noteHomeScreen> {
  //getting all notes
  Future<List<Map<String, dynamic>>> getNotes() async {
    final notes = await dbDatabase.db.getNotes();
    return notes;
  }

  void _addNote() async {
    // Navigate to the note creation screen
    await Navigator.pushNamed(
      context,
      AddNote.routeName,
    );
    setState(() {});
    await getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getNotes(),
        builder: (context, noteData) {
          switch (noteData.connectionState) {
            case ConnectionState.waiting:
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ConnectionState.done:
              {
                //Check that we didn't get a null
                if (noteData.data == null) {
                  return const Center(
                    child: Text("You don't have any notes yet, create one"),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: noteData.data!.length,
                      itemBuilder: (context, index) {
                        //Setting the different items
                        String title = noteData.data![index]["title"];
                        String body = noteData.data![index]["body"];
                        String creation_date =
                            noteData.data![index]["creation_date"];
                        int id = noteData.data![index]["id"];
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, ShowNote.routeName,
                                  arguments: NoteModel(
                                      id: id,
                                      title: title,
                                      body: body,
                                      creation_date:
                                          DateTime.parse(creation_date)));
                            },
                            title: Text(title),
                            subtitle: Text(body),
                          ),
                        );
                      },
                    ),
                  );
                }
              }
            default:
              {
                return const Center(
                  child: Text("An error occurred while fetching your notes"),
                );
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: const Icon(Icons.note_add),
      ),
    );
  }
}
