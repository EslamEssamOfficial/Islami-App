import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_prefs.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void getMostRecentSuraList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndicesList = prefs.getStringList(SharedPrefsKey.sharedPrefsKey) ?? [];
    mostRecentList = mostRecentIndicesList.map((e) => int.parse(e)).toList();
    notifyListeners();
  }

}