import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teduh_app/model/note_model.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  static Database? _database;

  //Membuat getter database
  Future<Database?> get database async {
    //pertama mengecek apakah sudah memiliki database?
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), "note_app.db"),
        onCreate: (db, version) async {
      //Membuat tabel pertama
      await db.execute('''
          CREATE TABLE notes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            body TEXT,
            creation_date TEXT
          )''');
    }, version: 1);
  }

  //Membuat fungsi untuk menambahkan note
  addNewNote(NoteModel note) async {
    final db = await database;
    db?.insert("notes", note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Buat fungsi yang akan mengambil database kita dan mengembalikan semua elemen
  // di dalam tabel catatan
  Future<dynamic> getNotes() async {
    final db = await database;
    var res = await db!.query("notes");
    if (res.isEmpty) {
      return null;
    } else {
      var resultMap = res.toList();
      return resultMap.isNotEmpty ? resultMap : Null;
    }
  }

  // Membuat function untuk menghapus note
  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db!.delete("notes", where: "id = ?", whereArgs: [id]);
  }

  // Membuat function untuk mengedit note
  Future<int> updateNote(NoteModel note) async {
    final db = await database;
    return await db?.update(
          'notes',
          note.toMap(),
          where: "id = ?",
          whereArgs: [note.id],
        ) ??
        0;
  }
}
