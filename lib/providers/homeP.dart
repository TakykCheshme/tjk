import 'package:flutter/material.dart';
import 'package:tjk/models/bannerr.dart';
import 'package:tjk/models/category.dart';
import 'package:tjk/services.dart/network.dart';

class HomeP extends ChangeNotifier {
  List<Bannerr> banners;
  List<Category> categories;

  HomeP() {
    print("runs HomeP");
    Network().getHome().then((data) {
      banners = data["banners"]
          .map<Bannerr>((json) => Bannerr.fromJson(json))
          .toList();
      categories = data["categories"]
          .map<Category>((json) => Category.fromJson(json))
          .toList();
      print(categories[0].products[0].name);
    });
  }
}
