import 'package:app_breaking_bad/common/domain/favoritable.dart';

class EpisodeModels extends Favoritable {
  final int numberEpisodeModel;
  final String titleModel;
  final String seasonModel;
  final String releaseDateModel;
  final String typeModel = 'Episode';

  EpisodeModels({
    required this.numberEpisodeModel,
    required this.titleModel,
    required this.seasonModel,
    required this.releaseDateModel,
  });

  @override
  List<Object?> get props => [
        numberEpisodeModel,
        titleModel,
        seasonModel,
        releaseDateModel,
      ];
  @override
  bool? get stringify => true;

  @override
  String toString() {
    return 'EpisodeModels(numberEpisodeModel: $numberEpisodeModel, titleModel: $titleModel, seasonModel: $seasonModel, releaseDateModel: $releaseDateModel,typeModel=Episode)';
  }

  Map<String, dynamic> toJson() => {
        'numberEpisodeModel': numberEpisodeModel,
        'titleModel': titleModel,
        'seasonModel': seasonModel,
        'releaseDateModel': releaseDateModel,
        'typeModel': "Episode",
      };

  factory EpisodeModels.fromJson(Map<String, dynamic> map) {
    return EpisodeModels(
      numberEpisodeModel: map['numberEpisodeModel'],
      titleModel: map['titleModel'],
      seasonModel: map['seasonModel'],
      releaseDateModel: map['releaseDateModel'],
    );
  }
}//end EpisodeModels
