import 'package:app_breaking_bad/common/favorite/favorites_models.dart';
import 'package:app_breaking_bad/presentation/widgets/favorites_elements_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesElementsProviderWidget extends StatefulWidget {
  const FavoritesElementsProviderWidget({Key? key}) : super(key: key);

  @override
  State<FavoritesElementsProviderWidget> createState() =>
      _FavoritesElementsProviderWidgetState();
}

class _FavoritesElementsProviderWidgetState
    extends State<FavoritesElementsProviderWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesModels>(
      builder: (context, value, child) {
        return FavoritesElementsWidget(favorites: value);
      },
    );
  }
}
