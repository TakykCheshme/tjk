import 'package:flutter/material.dart';
import 'package:tjk/models/bannerr.dart';
import 'package:tjk/models/category.dart';
import 'package:tjk/services.dart/network.dart';

import '../language.dart';

class HomeP extends ChangeNotifier {
  List<Bannerr> banners;
  List<Category> categories;

  bool _loading = true;
  bool get loading => _loading;

  String _error;
  String get error => _error;

  int _selectedCategory = 0;
  int get selectedCategory => _selectedCategory;
  set selectedCategory(int cat) {
    _selectedCategory = cat;
    notifyListeners();
  }

  void load() {
    _loading = true;
    notifyListeners();
    Network().getHome(ln).then((data) {
      if (data == null) //some dio error
      {
        _error = LN["internet_birikmanizi_barlan"][_ln];
        print(_error);
      } else {
        _error = null;
        banners = data["banners"]
            .map<Bannerr>((json) => Bannerr.fromJson(json))
            .toList();
        categories = data["categories"]
            .map<Category>((json) => Category.fromJson(json))
            .toList();
      }
      _loading = false;
      notifyListeners();
    });
  }

  String _ln;
  String get ln => _ln;
  set ln(String ln) {
    if (ln != _ln) {
      _ln = ln;
      load();
    }
  }
}
