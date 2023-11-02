import 'package:equatable/equatable.dart';

class Renungan extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
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
      required this.imageUrl,
      required this.views,
      required this.createdAt,
      required this.authorImageUrl});

  static List<Renungan> renungans = [
    Renungan(
      id: '1',
      title: 'Mengasihi Selagi Masih Ada',
      subtitle: 'Pengkotbah 3:1-15',
      body:
          'Agus sempat menyesali keputusannya ketika ia harus membawa keluarganya untuk kembali ke luar Jawa, karena masa liburan telah selesai. Pasalnya, ia pergi meninggalkan sang ayah yang dalam kondisi sakit. "Mengapa aku tidak tinggal barang sehari lagi, sehingga paling tidak aku dapat melihat saat terakhir ayah yang aku kasihi?" sesalnya. Ya, tak lama setelah Agus dan keluarganya tiba di tujuan, mereka mendengar sang ayah meninggal dunia. Alhasil, mereka pun harus kembali pulang untuk mengantarkan sang ayah menuju peristirahatan terakhirnya.Fakta kehidupan menunjukkan bahwa waktu kematian manusia memang tak bisa diketahui. Sebagian orang mendapat kesempatan melepas kepergian orang yang mereka kasihi, bahkan sempat menutupkan kelopak mata sambil mendekap untuk terakhir kalinya. Namun, ada pula orang-orang yang tak memiliki kesempatan itu karena satu dan lain hal. Itulah bagian dari misteri kehidupan, dimana ada kehendak Allah yang turut bekerja di sana. Nas renungan hari ini mengingatkan kita mengenai waktu atas segala sesuatu di bawah langit. Selain waktu untuk meninggal, ada pula waktu untuk menikmati waktu bersama orang-orang yang dekat dengan hati kita, dengan cara mengasihi mereka ... sewaktu mereka masih hidup. Pada saatnya, setiap manusia akan berpulang kepada-Nya. Namun, kenangan yang kelak akan melekat atas setiap orang yang kita kasihi, itulah yang perlu kita upayakan semasa hidup yang Allah karuniakan, dalam segala situasi yang Allah izinkan terjadi. Kira-kira apa yang telah dan akan kita lakukan? MENIKMATI KEHIDUPAN BERSAMA ORANG TERKASIH ADALAH KEBAHAGIAAN YANG TAK TERNILAI HARGANYA.',
      author: 'Pdt Mesakh Eka Timesa',
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
      subtitle: 'Mazmur 8',
      body:
          'Pernahkah kita merenung dan bertanya, "Siapakah manusia?" Ya, benar bahwa manusia adalah kita. Namun, kenyataan ini sering kali tidak kita refleksikan dalam kehidupan nyata, karena ke-aku-an kita yang lebih besar daripada keberadaan kita sebagai manusia yang lemah. Kita lebih berhasrat mengejar pengakuan dan hormat, memilih pamer diri untuk kebanggaan, atau bahkan sekedar menyibukkan diri dengan berbagai macam hal untuk memenuhi segala keinginan hidup. Mazmur 8 mengungkapkan betapa mulianya Tuhan, dengan berkaca pada perhatian dan pemeliharaan Tuhan bagi seluruh ciptaan-Nya, termasuk kepada manusia. Oleh karena itu, Daud bermazmur, "Apakah manusia, sehingga Engkau mengingatnya?" Menariknya, pemazmur menggunakan kata tanya "apa", dan bukan "siapa" dalam merujuk manusia. Padahal kata tanya "apa" digunakan untuk menanyakan suatu peristiwa atau bahkan suatu benda. Artinya, sang pemazmur tahu betul siapa dirinya di hadapan Tuhan, bahwa dia hanyalah "apa", dan bukan "siapa-siapa". Ia menyadari betul betapa rendahnya manusia di hadapan Tuhan. Namun, ia sungguh bersukacita, sebab Tuhan yang Mahakuasa bersedia mengingat dan bahkan mengindahkan manusia yang hanyalah "apa". Daud mengajak kita untuk menyadari betul bahwa kita bukanlah siapa-siapa. Seberapa pun hebatnya kita, tinggi rendah jabatan kita, tidak lantas membuat kita menjadi serba bisa. Maka marilah kita menjalani hidup dengan rendah hati, dan bukan dengan kehebatan kita. RENDAH HATILAH, SEBAB KITA HANYA SEBUAH "APA" DI HADAPAN TUHAN.',
      author: 'Pdm Wenda Gayuh',
      authorImageUrl:
          'https://scontent.fsrg10-1.fna.fbcdn.net/v/t1.18169-9/13445242_469040283292956_8364225859986765522_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=7a1959&_nc_eui2=AeHwSigETt5JFHbjl_-jvLd_0BC3FLUZxmvQELcUtRnGawOeTJhmLiYrxv4WoB8w1jXieZMr-qkg5hua0iNoEk9C&_nc_ohc=rtxvF20iTssAX-TGWRi&_nc_ht=scontent.fsrg10-1.fna&oh=00_AfAml6RCMlIAx4i9pzYd8VilHI0SJkBq7Dw_CsUl-BmX1A&oe=656788F7',
      views: 1314,
      imageUrl:
          'https://i.pinimg.com/564x/35/4a/03/354a036491d8b972e7faadb345302ede.jpg',
      createdAt: DateTime.now().subtract(const Duration(hours: 7)),
    ),
  ];

  @override
  List<Object?> get props => [];
}
