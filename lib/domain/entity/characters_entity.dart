import 'package:equatable/equatable.dart';

class CharactersEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  late bool isFavorite;

  CharactersEntity({
    required this.isFavorite,
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, imageUrl];

  void setFavoriteCharacter(bool favortie) {
    isFavorite = favortie;
  }
}
