import 'package:app_breaking_bad/common/domain/favoritable.dart';
import 'package:flutter/foundation.dart';

class FavoritesModels extends ChangeNotifier {
  final List<Favoritable> favoriteList = [];

  void addNewFavoriteElement(Favoritable element) {
    favoriteList.add(element);
    notifyListeners();
  }

  void removeFavoriteElement(Favoritable elementToRemove) {
    favoriteList.removeWhere((element) => element == elementToRemove);
    notifyListeners();
  }

  List<Favoritable> get listFavoritesElements => favoriteList;
}
