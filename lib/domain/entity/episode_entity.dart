import 'package:equatable/equatable.dart';

class EpisodeEntity extends Equatable {
  final int numberEpisode;
  final String title;
  final String season;
  final String releaseDate;
  bool isFavorite;

  EpisodeEntity({
    required this.numberEpisode,
    required this.title,
    required this.season,
    required this.releaseDate,
    required this.isFavorite,
  });
  @override
  List<Object?> get props => [
        numberEpisode,
        title,
        season,
        releaseDate,
      ];
}
