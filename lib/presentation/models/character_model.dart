// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_breaking_bad/common/domain/favoritable.dart';

class CharacterModels extends Favoritable {
  final int idModel;
  final String nameModel;
  final String imageUrlModel;
  //final String typeModel = 'Character';

  CharacterModels({
    required this.idModel,
    required this.nameModel,
    required this.imageUrlModel,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [idModel, nameModel, imageUrlModel];

  @override
  // TODO: implement stringify
  bool? get stringify => true;

  @override
  String toString() =>
      'CharacterModels(idModel: $idModel, nameModel: $nameModel, imageUrlModel: $imageUrlModel)';
}
