import 'package:app_breaking_bad/domain/entity/characters_entity.dart';

class CharactersModels {
  final int modelId;
  final String modelName;
  final String modelNickname;
  final String modelUrlImage;
  final List<dynamic> modelDescription;
  final String modelBirthday;

  CharactersModels({
    required this.modelId,
    required this.modelName,
    required this.modelNickname,
    required this.modelUrlImage,
    required this.modelDescription,
    required this.modelBirthday,
  });

  factory CharactersModels.fromJson(Map<String, dynamic> json) {
    return CharactersModels(
      modelId: json['char_id'] as int,
      modelName: json['name'] as String,
      modelNickname: json['nickname'] as String,
      modelUrlImage: json['img'] as String,
      modelBirthday: json['birthday'] as String,
      modelDescription: json['occupation'] as List<dynamic>,
    );
  }

  CharactersEntity toEntity() {
    return CharactersEntity(
      id: modelId,
      name: modelName,
      imageUrl: modelUrlImage,
      isFavorite: false,
    );
  }
}
