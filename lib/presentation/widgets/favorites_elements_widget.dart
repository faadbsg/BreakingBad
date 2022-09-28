import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:app_breaking_bad/common/domain/favoritable.dart';
import 'package:app_breaking_bad/common/favorite/favorites_models.dart';
import 'package:app_breaking_bad/presentation/models/character_model.dart';
import 'package:app_breaking_bad/presentation/models/episode_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesElementsWidget extends StatefulWidget {
  final FavoritesModels favorites;
  const FavoritesElementsWidget({Key? key, required this.favorites})
      : super(key: key);

  @override
  State<FavoritesElementsWidget> createState() =>
      _FavoritesElementsWidgetState();
}

class _FavoritesElementsWidgetState extends State<FavoritesElementsWidget> {
  late SharedPreferences shared;
  List<String> listFavoriteString = [];
  List<Favoritable> favoritableList = [];

  @override
  void initState() {
    super.initState();
    shared = context.read<SharedPreferences>();
    loadDataList().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> loadDataList() async {
    listFavoriteString = shared.getStringList('FavoriteList') ?? [];
  }

  @override
  Widget build(BuildContext context) {
    print('build FavoritesElementsWidget');
    favoritableList = decodeElementList(listFavoriteString);
    print(favoritableList);
    var listFavoriteElement = widget.favorites.listFavoritesElements;
    listFavoriteElement.forEach((element) {
      addElementInFavoriteList(element);
    });
    var list = favoritableList + listFavoriteElement;
    //delete duplicate favorite element
    var listFavorite = list.toSet().toList();
    return ListView.builder(
        itemCount: listFavorite.length,
        itemBuilder: ((context, index) {
          return displayFavoriteElement(listFavorite.elementAt(index));
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

  void addElementInFavoriteList(Favoritable element) {
    if ((element is CharacterModels)) {
      listFavoriteString.add(json.encode(element.toJson()));
    } else if (element is EpisodeModels) {
      listFavoriteString.add(json.encode(element.toJson()));
    }
    var listRecorded = listFavoriteString.toSet().toList();
    shared.setStringList('FavoriteList', listRecorded);
  }

  List<Favoritable> decodeElementList(List<String> mapString) {
    final mapConverted = mapString.map((e) {
      final eConvertDynamic = json.decode(e);
      if (eConvertDynamic['typeModel'] == 'Character') {
        return CharacterModels.fromJson(eConvertDynamic);
      } else if (eConvertDynamic['typeModel'] == 'Episode') {
        return EpisodeModels.fromJson(eConvertDynamic);
      }
    }).toList();
    mapConverted.removeWhere((element) => element == null);
    return List<Favoritable>.from(mapConverted);
  }
  //   final elementDecoded = json.decode(element);
  //   if (elementDecoded['typeModel'] == 'Character') {
  //     favoritableList.add(CharacterModels.fromJson(elementDecoded));
  //   } else if (elementDecoded['typeModel'] == 'Episode') {
  //     favoritableList.add(EpisodeModels.fromJson(elementDecoded));
  //   }
  // }
}
