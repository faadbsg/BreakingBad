import 'package:app_breaking_bad/presentation/widgets/characters_provider_widget.dart';
import 'package:app_breaking_bad/presentation/widgets/episodes_provider_widget.dart';
import 'package:flutter/material.dart';

class TabBarElementList extends StatelessWidget {
  const TabBarElementList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        TabBar(tabs: [
          Text('Characters'),
          Text('Episodes'),
          //Text('Favorites'),
        ]),
        TabBarView(children: <Widget>[
          CharactersProviderWidget(),
          EpisodesProviderWidget(),
        ]),
      ],
    );
  }
}
