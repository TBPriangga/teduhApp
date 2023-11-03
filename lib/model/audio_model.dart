import 'package:equatable/equatable.dart';

class Audio extends Equatable {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  const Audio({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Audio> audios = [
    const Audio(
      title: 'Keluarga yang saling menghormati',
      description: 'Kolose 3:12',
      url: 'assets/audio/audio1.mp3',
      coverUrl: 'assets/images/images1.jpg',
    )
  ];

  @override
  List<Object> get props => [];
}
