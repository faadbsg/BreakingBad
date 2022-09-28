import 'package:app_breaking_bad/common/domain/favoritable.dart';

class CharacterModels extends Favoritable {
  final int idModel;
  final String nameModel;
  final String imageUrlModel;
  final String typeModel = 'Character';

  CharacterModels({
    required this.idModel,
    required this.nameModel,
    required this.imageUrlModel,
  });

  @override
  List<Object?> get props => [idModel, nameModel, imageUrlModel];

  @override
  bool? get stringify => true;

  @override
  String toString() =>
      'CharacterModels(idModel: $idModel, nameModel: $nameModel, imageUrlModel: $imageUrlModel,typeModel=Character)';

  Map<String, dynamic> toJson() => {
        'idModel': idModel,
        'nameModel': nameModel,
        'imageUrlModel': imageUrlModel,
        'typeModel': "Character",
      };

  factory CharacterModels.fromJson(Map<String, dynamic> map) {
    return CharacterModels(
      idModel: map['idModel'],
      nameModel: map['nameModel'],
      imageUrlModel: map['imageUrlModel'],
    );
  }
}//end CharacterModels
