import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tjk/models/product.dart';

class AppP extends ChangeNotifier {
  Box tjkBox;

  String _ln;
  String get ln => _ln;
  set ln(String ln) {
    _ln = ln;
    tjkBox.put("ln", ln);
    notifyListeners();
  }

  List<Product> favorites;

  AppP() {
    tjkBox = Hive.box("tjk");
    _ln = tjkBox.get("ln", defaultValue: "tm");
    notifyListeners();
  }
}
