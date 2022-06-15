import 'package:app_breaking_bad/presentation/pages/display_characters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
        ),
        body: SingleChildScrollView(
          child: buildBody(context),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Image.asset('assets/images/BreakingBad.jpg'),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: InkWell(
              child: const Center(child: Text('Search characters')),
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const DisplayCharacters(),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
