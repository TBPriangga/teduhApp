import 'package:equatable/equatable.dart';

class Renungan extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String category;
  final String imageUrl;
  final int views;
  final DateTime createdAt;

  const Renungan({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.author,
    required this.category,
    required this.imageUrl,
    required this.views,
    required this.createdAt,
  });

  static List<Renungan> renungans = [
    Renungan(
      id: '1',
      title: 'Mengasihi Selagi Masih Ada',
      subtitle: 'Subtitle 1',
      body: 'Body 1',
      author: 'Pdt Mesakh Eka Timesa',
      category: 'Category 1',
      views: 1204,
      imageUrl:
          'https://hop.church/wp-content/uploads/2019/06/DH-Dikasihi-Allah-Dan-Sesama.jpg',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Renungan(
      id: '2',
      title: 'Manusia Hanya Sebuah "Apa"',
      subtitle: 'Subtitle 2',
      body: 'Body 2',
      author: 'Pdm Wenda Gayuh',
      category: 'Category 2',
      views: 1314,
      imageUrl:
          'https://i.pinimg.com/564x/35/4a/03/354a036491d8b972e7faadb345302ede.jpg',
      createdAt: DateTime.now().subtract(const Duration(hours: 7)),
    ),
  ];

  @override
  List<Object?> get props => [];
}
