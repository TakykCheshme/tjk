import 'package:flutter/material.dart';
import 'package:tjk/models/product.dart';
import 'package:tjk/services.dart/network.dart';

class SearchP extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  List<Product> products;

  search(String word) {
    _loading = true;
    notifyListeners();

    Network().getSearch(word, _ln).then((data) {
      products = data["products"]
          .map<Product>((json) => Product.fromJson(json))
          .toList();

      _loading = false;
      notifyListeners();
    });
  }

  String _ln;
  String get ln => _ln;
  set ln(String ln) {
    _ln = ln;
    notifyListeners();
  }
}
