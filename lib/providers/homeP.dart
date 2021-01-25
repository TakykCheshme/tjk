import 'package:flutter/material.dart';
import 'package:tjk/models/bannerr.dart';
import 'package:tjk/models/category.dart';
import 'package:tjk/services.dart/network.dart';

class HomeP extends ChangeNotifier {
  List<Bannerr> banners;
  List<Category> categories;

  bool _loading = true;
  bool get loading => _loading;

  int _selectedCategory = 0;
  int get selectedCategory => _selectedCategory;
  set selectedCategory(int cat) {
    _selectedCategory = cat;
    notifyListeners();
  }

  HomeP() {
    print("runs HomeP");
    Network().getHome().then((data) {
      banners = data["banners"]
          .map<Bannerr>((json) => Bannerr.fromJson(json))
          .toList();
      categories = data["categories"]
          .map<Category>((json) => Category.fromJson(json))
          .toList();
      _loading = false;
    });
  }
}
