// ignore_for_file: non_constant_identifier_names

class NoteModel {
  int id; // Biarkan id tetap ada sebagai properti
  String title;
  String body;
  DateTime creation_date;

  NoteModel({
    required this.id,
    required this.title,
    required this.body,
    required this.creation_date,
  });

  // Membuat fungsi untuk mengkonversi item menjadi map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'creation_date': creation_date.toString(),
    };
  }

  // Membuat konstruktor dari map.
  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      creation_date: DateTime.parse(map['creation_date']),
    );
  }

  //Membuat model untuk edit note
  NoteModel copyWith({
    int? id,
    String? title,
    String? body,
    DateTime? creation_date,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      creation_date: creation_date ?? this.creation_date,
    );
  }
}
