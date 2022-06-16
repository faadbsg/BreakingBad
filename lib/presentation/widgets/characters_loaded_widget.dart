import 'package:app_breaking_bad/common/favorite/favorites_models.dart';
import 'package:app_breaking_bad/domain/entity/characters_entity.dart';
import 'package:app_breaking_bad/presentation/models/character_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadedCharacterWidget extends StatefulWidget {
  final List<CharactersEntity> charactersList;
  const LoadedCharacterWidget({Key? key, required this.charactersList})
      : super(key: key);

  @override
  State<LoadedCharacterWidget> createState() => _LoadedCharacterWidgetState();
}

class _LoadedCharacterWidgetState extends State<LoadedCharacterWidget> {
  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesModels>().listFavoritesElements;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.charactersList.length,
        separatorBuilder: ((context, index) => const Divider()),
        itemBuilder: ((context, index) {
          final character = widget.charactersList[index];
          final charactermodel = CharacterModels(
            idModel: character.id,
            nameModel: character.name,
            imageUrlModel: character.imageUrl,
          );
          final charactermodel2 = CharacterModels(
            idModel: character.id,
            nameModel: character.name,
            imageUrlModel: character.imageUrl,
          );
          late int favoriteIndex;
          favoriteIndex =
              favorites.indexWhere((element) => element == charactermodel);
          final bool isCharacterFavorite = favoriteIndex != -1;
          return ListTile(
            leading: Image.network(character.imageUrl),
            title: Text(character.name),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  if (!isCharacterFavorite) {
                    Provider.of<FavoritesModels>(context, listen: false)
                        .addNewFavoriteElement(charactermodel);
                  } else {
                    Provider.of<FavoritesModels>(context, listen: false)
                        .removeFavoriteElement(charactermodel);
                  }
                });
              },
              icon: Icon(
                Icons.star,
                color: isCharacterFavorite ? Colors.red : Colors.grey,
              ),
            ),
          );
        }),
      ),
    );
  }
}
