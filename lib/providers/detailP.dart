import 'package:flutter/material.dart';
import 'package:tjk/const.dart';
import 'package:tjk/services.dart/network.dart';

class DetailP extends ChangeNotifier {
  List<String> _images;
  List<String> _attributes;

  List<String> get images => _images;
  List<String> get attributes => _attributes;

  DetailP({int id, int categoryId}) {
    Network().getDetail(id: id, categoryId: categoryId).then((product) {
      _images = product["product"]["images"]
          .map<String>((image) => getCoverById(image["id"]))
          .toList();
      _attributes = product["attributes"]
          .map<String>((attribute) => attribute["value"])
          .toList();
    });
  }
}
