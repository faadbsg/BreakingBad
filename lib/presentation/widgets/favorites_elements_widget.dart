import 'package:app_breaking_bad/common/domain/favoritable.dart';
import 'package:app_breaking_bad/common/favorite/favorites_models.dart';
import 'package:app_breaking_bad/presentation/models/character_model.dart';
import 'package:app_breaking_bad/presentation/models/episode_model.dart';
import 'package:flutter/material.dart';

class FavoritesElementsWidget extends StatefulWidget {
  final FavoritesModels favorites;
  const FavoritesElementsWidget({Key? key, required this.favorites})
      : super(key: key);

  @override
  State<FavoritesElementsWidget> createState() =>
      _FavoritesElementsWidgetState();
}

class _FavoritesElementsWidgetState extends State<FavoritesElementsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.favorites.listFavoritesElements.length,
        itemBuilder: ((context, index) {
          return displayFavoriteElement(
              widget.favorites.listFavoritesElements.elementAt(index));
        }));
  }

  Widget displayFavoriteElement(Favoritable favElement) {
    if (favElement is EpisodeModels) {
      return ListTile(
        isThreeLine: true,
        title: Text(
            'Episode ${favElement.numberEpisodeModel} : ${favElement.titleModel}'),
        subtitle: Text(
          'Season : ${favElement.seasonModel} \nDate of relase : ${favElement.releaseDateModel}',
        ),
      );
    } else if (favElement is CharacterModels) {
      return Card(
        color: Colors.transparent,
        child: ListTile(
          leading: Image.network(favElement.imageUrlModel),
          title: Text(favElement.nameModel),
        ),
      );
    } else {
      return Container();
    }
  }
}
