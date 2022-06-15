import 'package:equatable/equatable.dart';

class FavoritesEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final int numberEpisode;
  final String title;
  final String season;
  final String releaseDate;

  const FavoritesEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.numberEpisode,
    required this.title,
    required this.season,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        numberEpisode,
        title,
        season,
        releaseDate,
      ];
}
