// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  // TODO: implement stringify
  bool? get stringify => true;

  @override
  String toString() {
    return 'EpisodeModels(numberEpisodeModel: $numberEpisodeModel, titleModel: $titleModel, seasonModel: $seasonModel, releaseDateModel: $releaseDateModel)';
  }
}
