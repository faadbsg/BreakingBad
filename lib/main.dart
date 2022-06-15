import 'package:app_breaking_bad/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breaking Bad App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const WelcomePage(),
    );
  }
}
