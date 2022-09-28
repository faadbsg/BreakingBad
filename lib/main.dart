import 'package:app_breaking_bad/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection_container.dart' as di;

late final _sharedpreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _sharedpreferences = await SharedPreferences.getInstance();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Provider<SharedPreferences>.value(
      value: _sharedpreferences,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Breaking Bad App',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const WelcomePage(),
      ),
    );
  }
}
