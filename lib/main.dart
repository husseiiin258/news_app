import 'package:flutter/material.dart';
import 'package:news_app/settings/settings_view.dart';
import 'package:news_app/splash_screen.dart';
import 'package:provider/provider.dart';

import 'app_provider.dart';
import 'home/home_layout.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeLayout.routeName: (context) => HomeLayout(),
        SettingsView.routeName: (context) => SettingsView(),

      },
    );
  }
}