import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tjk/models/product.dart';

class FavoritesP extends ChangeNotifier {
  Box _tjkBox = Hive.box("tjk");
  set tjkBox(Box box) {
    _tjkBox = box;
  }

  List<Product> _favorites = [];
  List<Product> get all => _favorites;

  void toggle(Product product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
      _tjkBox.put("fav" + product.id.toString(), false);
    } else {
      _favorites.add(product);
      _tjkBox.put("fav" + product.id.toString(), true);
    }
    _tjkBox.put("fav", _favorites);
    notifyListeners();
  }

  bool isFav(Product product) {
    return _tjkBox.get("fav" + product.id.toString(), defaultValue: false);
  }

  FavoritesP() {
    _favorites = _tjkBox.get("fav", defaultValue: <Product>[]).cast<Product>();
  }
}
