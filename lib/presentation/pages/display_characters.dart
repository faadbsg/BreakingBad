import 'package:app_breaking_bad/common/favorite/favorites_models.dart';
import 'package:app_breaking_bad/presentation/widgets/characters_provider_widget.dart';
import 'package:app_breaking_bad/presentation/widgets/episodes_provider_widget.dart';
import 'package:app_breaking_bad/presentation/widgets/favorites_elements_provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayCharacters extends StatefulWidget {
  const DisplayCharacters({Key? key}) : super(key: key);

  @override
  State<DisplayCharacters> createState() => _DisplayCharacters();
}

class _DisplayCharacters extends State<DisplayCharacters>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.red,
              Colors.orange,
              Colors.amber,
              Colors.black,
            ]),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Breaking Bad'),
          centerTitle: true,
          bottom: TabBar(controller: _controller, tabs: const <Widget>[
            Text('Characters'),
            Text('Episodes'),
            Text('Favorites'),
          ]),
        ),
        backgroundColor: Colors.transparent,
        body: ChangeNotifierProvider(
          create: (context) => FavoritesModels(),
          child: TabBarView(controller: _controller, children: const <Widget>[
            CharactersProviderWidget(),
            EpisodesProviderWidget(),
            FavoritesElementsProviderWidget(),
          ]),
        ),
      ),
    );
  }
}
