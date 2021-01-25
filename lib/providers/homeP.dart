import 'package:flutter/material.dart';
import 'package:tjk/models/bannerr.dart';
import 'package:tjk/models/category.dart';
import 'package:tjk/services.dart/network.dart';

class HomeP extends ChangeNotifier {
  List<Bannerr> banners;
  List<Category> categories;

  bool _loading = true;
  bool get loading => _loading;

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
