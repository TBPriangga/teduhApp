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
  final String authorImageUrl;

  const Renungan(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.body,
      required this.author,
      required this.category,
      required this.imageUrl,
      required this.views,
      required this.createdAt,
      required this.authorImageUrl});

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
      authorImageUrl:
          'https://scontent.fsrg10-1.fna.fbcdn.net/v/t1.18169-9/11924258_10207469524527074_1782399026315198523_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=7a1959&_nc_eui2=AeGjUQvmegEUwLp0p9lu38_uLrNZZjyYsvkus1lmPJiy-WYTVnJUF2R5m5_APR8QGulkyNnwNGmYj-3OiCvSYGyW&_nc_ohc=Z5XizfwHvlYAX_JwHyx&_nc_ht=scontent.fsrg10-1.fna&oh=00_AfDZ6PjMFnmyGHiv8YhPXJuRV-7LmYEyY1ctjQ6DQW5IRQ&oe=65678A5F',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Renungan(
      id: '2',
      title: 'Manusia Hanya Sebuah "Apa"',
      subtitle: 'Subtitle 2',
      body: 'Body 2',
      author: 'Pdm Wenda Gayuh',
      authorImageUrl:
          'https://scontent.fsrg10-1.fna.fbcdn.net/v/t1.18169-9/13445242_469040283292956_8364225859986765522_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=7a1959&_nc_eui2=AeHwSigETt5JFHbjl_-jvLd_0BC3FLUZxmvQELcUtRnGawOeTJhmLiYrxv4WoB8w1jXieZMr-qkg5hua0iNoEk9C&_nc_ohc=rtxvF20iTssAX-TGWRi&_nc_ht=scontent.fsrg10-1.fna&oh=00_AfAml6RCMlIAx4i9pzYd8VilHI0SJkBq7Dw_CsUl-BmX1A&oe=656788F7',
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
