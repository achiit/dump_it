import 'package:dump_it/app/app_theme.dart';
import 'package:dump_it/ui/views/home_view.dart';
import 'package:dump_it/ui/views/splash_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: appTheme(),
      home: SplashView(),
      routes: {
        '/home': (context) => const HomeView(),
      },
    );
  }
}