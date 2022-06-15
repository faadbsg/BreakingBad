import 'package:app_breaking_bad/common/favorite/favorites_models.dart';
import 'package:app_breaking_bad/domain/entity/episode_entity.dart';
import 'package:app_breaking_bad/presentation/models/Episode_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EpisodeLoadedWidget extends StatefulWidget {
  final List<EpisodeEntity> episodesList;
  const EpisodeLoadedWidget({Key? key, required this.episodesList})
      : super(key: key);

  @override
  State<EpisodeLoadedWidget> createState() => _EpisodeLoadedWidgetState();
}

class _EpisodeLoadedWidgetState extends State<EpisodeLoadedWidget> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    i += 1;
    print('build ${i}');
    final favorites = context.watch<FavoritesModels>().listFavoritesElements;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.episodesList.length,
          separatorBuilder: ((context, index) => const Divider()),
          itemBuilder: ((context, index) {
            final episode = widget.episodesList[index];
            final episodeModel = EpisodeModels(
              numberEpisodeModel: episode.numberEpisode,
              titleModel: episode.title,
              seasonModel: episode.season,
              releaseDateModel: episode.releaseDate,
            );
            late int favoriteIndex;
            favoriteIndex =
                favorites.indexWhere((element) => element == episodeModel);
            final bool isEpisodeFavorite = favoriteIndex != -1;
            return ListTile(
              isThreeLine: true,
              title:
                  Text('Episode ${episode.numberEpisode} : ${episode.title}'),
              subtitle: Text(
                'Season : ${episode.season} \nDate of relase : ${episode.releaseDate}',
              ),
              trailing: IconButton(
                onPressed: () {
                  if (!isEpisodeFavorite) {
                    print('add new favorite episode');
                    Provider.of<FavoritesModels>(context, listen: false)
                        .addNewFavoriteElement(episodeModel);
                  } else {
                    print('remove a favorite episode');
                    Provider.of<FavoritesModels>(context, listen: false)
                        .removeFavoriteElement(episodeModel);
                  }
                  setState(() {});
                },
                icon: Icon(
                  Icons.star,
                  color: isEpisodeFavorite ? Colors.red : Colors.grey,
                ),
              ),
            );
          })),
    );
  }
}
