import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/home/tabs/quran/details_1/sura_details_screen.dart';
import 'package:islami_app/ui/home/tabs/quran/details_2/sura_details_screen2.dart';
import 'package:islami_app/utils/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        SuraDetailsScreen2.routeName: (context) => SuraDetailsScreen2(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
