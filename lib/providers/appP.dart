import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AppP extends ChangeNotifier {
  Box tjkBox;

  int _selectedTab = 0;
  int get selectedTab => _selectedTab;
  set selectedTab(int tab) {
    _selectedTab = tab;
    notifyListeners();
  }

  String _ln;
  String get ln => _ln;
  set ln(String ln) {
    _ln = ln;
    tjkBox.put("ln", ln);
    notifyListeners();
  }

  AppP() {
    _initHive().then((box) {
      tjkBox = box;
      _ln = box.get("ln", defaultValue: "tm");
      notifyListeners();
    });
  }

  Future<Box> _initHive() async {
    Directory path = await getApplicationDocumentsDirectory();
    Hive.init(path.path);
    return await Hive.openBox("tjk");
  }
}
