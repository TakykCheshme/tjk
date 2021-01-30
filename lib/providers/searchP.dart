import 'package:flutter/material.dart';
import 'package:tjk/models/product.dart';
import 'package:tjk/services.dart/network.dart';

import '../language.dart';

class SearchP extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  String _error;
  String get error => _error;

  List<Product> products;

  search(String word) {
    _loading = true;
    notifyListeners();

    Network().getSearch(word, _ln).then((data) {
      if (data == null)
        _error = LN["internet_birikmanizi_barlan"][_ln];
      else {
        _error = null;
        products = data["products"]
            .map<Product>((json) => Product.fromJson(json))
            .toList();
      }

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
