// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:teduh_app/db/database.dart';

import '../../model/note_model.dart';

class AddNote extends StatefulWidget {
  final NoteModel? note;

  const AddNote({Key? key, this.note}) : super(key: key);

  static const routeName = '/addnote';
  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late String title;
  late String body;
  late DateTime date;

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      title = widget.note!.title;
      body = widget.note!.body;
      date = widget.note!.creation_date;
      titleController.text = title;
      bodyController.text = body;
    }
  }

  void _addNote() {
    setState(() {
      title = titleController.text;
      body = bodyController.text;
      date = DateTime.now();
    });
    NoteModel note = NoteModel(
      id: widget.note?.id ?? date.microsecondsSinceEpoch,
      title: title,
      body: body,
      creation_date: widget.note?.creation_date ?? date,
    );
    if (widget.note != null) {
      dbDatabase.db.updateNote(note);
      print("Note updated successfully");
    } else {
      dbDatabase.db.addNewNote(note);
      print("Note added successfully");
    }
    Navigator.pushNamedAndRemoveUntil(
        context, "/notehomescreen", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.note != null ? "Edit note" : "Add new note"),
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
        label: Text(widget.note != null ? "Update Note" : "Save Note"),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
