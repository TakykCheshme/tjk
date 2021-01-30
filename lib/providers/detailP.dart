import 'package:flutter/material.dart';
import 'package:tjk/const.dart';
import 'package:tjk/models/attribute.dart';
import 'package:tjk/models/product.dart';
import 'package:tjk/services.dart/network.dart';

import '../language.dart';

class DetailP extends ChangeNotifier {
  bool _loading = true;
  bool get loading => _loading;

  String _error;
  String get error => _error;

  int _selectedAttribute = 0;
  int get selectedAttribute => _selectedAttribute;
  set selectedAttribute(int attr) {
    _selectedAttribute = attr;
    notifyListeners();
  }

  List<String> _images;
  List<Attribute> _attributes;
  List<Product> _related;

  List<String> get images => _images;
  List<Attribute> get attributes => _attributes;
  List<Product> get related => _related;

  void load(int id, int categoryId) {
    _loading = true;
    notifyListeners();

    Network().getDetail(id: id, categoryId: categoryId).then((product) {
      if (product == null) {
        _error = LN["internet_birikmanizi_barlan"][_ln];
      } else {
        _error = null;
        _images = product["product"]["images"]
            .map<String>((image) => getCoverById(image["id"]))
            .toList();
        _attributes = product["attributes"]
            .map<Attribute>((attribute) => Attribute.fromJson(attribute))
            .toList();
        _related = product["related"]
            .map<Product>((json) => Product.fromJson(json))
            .toList();
      }

      _loading = false;
      notifyListeners();
    });
  }

  DetailP({int id, int categoryId}) {
    load(id, categoryId);
  }

  String _ln;
  String get ln => _ln;
  set ln(String ln) {
    _ln = ln;
    notifyListeners();
  }
}
