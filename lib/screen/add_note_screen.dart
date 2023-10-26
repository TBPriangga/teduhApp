import 'package:flutter/material.dart';
import 'package:teduh_app/db/database_provider.dart';

import '../model/note_model.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late String title;
  late String body;
  late DateTime date;

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  void _addNote() {
    setState(() {
      title = titleController.text;
      body = bodyController.text;
      date = DateTime.now();
    });
    NoteModel note = NoteModel(
      id: date.microsecondsSinceEpoch,
      title: title,
      body: body,
      creation_date: date,
    );
    DatabaseProvider.db.addNewNote(note);
    print("Note added successfully");
    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new note"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Note Title",
              ),
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: TextField(
                controller: bodyController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Your note",
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addNote,
        label: const Text("Save Note"),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
