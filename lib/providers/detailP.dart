import 'package:flutter/material.dart';
import 'package:tjk/const.dart';
import 'package:tjk/models/product.dart';
import 'package:tjk/services.dart/network.dart';

class DetailP extends ChangeNotifier {
  bool _loading = true;
  bool get loading => _loading;

  int _selectedAttribute = 0;
  int get selectedAttribute => _selectedAttribute;
  set selectedAttribute(int attr) {
    _selectedAttribute = attr;
    notifyListeners();
  }

  List<String> _images;
  List<String> _attributes;
  List<Product> _related;

  List<String> get images => _images;
  List<String> get attributes => _attributes;
  List<Product> get related => _related;

  DetailP({int id, int categoryId}) {
    Network().getDetail(id: id, categoryId: categoryId).then((product) {
      _images = product["product"]["images"]
          .map<String>((image) => getCoverById(image["id"]))
          .toList();
      _attributes = product["attributes"]
          .map<String>(
              (attribute) => dashSlashRemover(attribute["value"].toString()))
          .toList();
      _related = product["related"]
          .map<Product>((json) => Product.fromJson(json))
          .toList();

      _loading = false;
      notifyListeners();
    });
  }
}
