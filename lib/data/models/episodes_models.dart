import 'package:app_breaking_bad/domain/entity/episode_entity.dart';

class EpisodesModels {
  final int numberEpisodeModel;
  final String titleModel;
  final String seasonModel;
  final String releaseDateModel;

  EpisodesModels({
    required this.numberEpisodeModel,
    required this.titleModel,
    required this.seasonModel,
    required this.releaseDateModel,
  });

  factory EpisodesModels.fromJson(Map<String, dynamic> jsonMap) {
    return EpisodesModels(
      numberEpisodeModel: jsonMap['episode_id'] as int,
      titleModel: jsonMap['title'] as String,
      seasonModel: jsonMap['season'] as String,
      releaseDateModel: jsonMap['air_date'],
    );
  }

  EpisodeEntity toEntity() {
    return EpisodeEntity(
      numberEpisode: numberEpisodeModel,
      title: titleModel,
      season: seasonModel,
      releaseDate: releaseDateModel,
      isFavorite: false,
    );
  }
}
