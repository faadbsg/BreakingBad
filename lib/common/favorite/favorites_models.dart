import 'package:app_breaking_bad/common/domain/favoritable.dart';
import 'package:app_breaking_bad/presentation/models/character_model.dart';
import 'package:app_breaking_bad/presentation/models/episode_model.dart';
import 'package:flutter/foundation.dart';

class FavoritesModels extends ChangeNotifier {
  final List<Favoritable> favoriteList = [];

  void addNewFavoriteElement(Favoritable element) {
    favoriteList.add(element);
    print('FavoriteModels add: favoriteList = $favoriteList');
    notifyListeners();
  }

  void removeFavoriteElement(Favoritable elementToRemove) {
    // final elementTitleEpisode = element.title;
    // final elementImage = element.imageUrl;
    // if (element.imageUrl == '') {
    //   favoriteList
    //       .removeWhere((element) => element.title == elementTitleEpisode);
    // } else {
    //   favoriteList.removeWhere((element) => element.imageUrl == elementImage);
    // }
    favoriteList.removeWhere((element) => element == elementToRemove);
    print('FavoriteModels remove: favoriteList = $favoriteList');
    notifyListeners();
  }

  List<Favoritable> get listFavoritesElements => favoriteList;

  /*FavoritesEntity favoriteAt(int index) {
    return favoriteList.elementAt(index);
  }*/
}
