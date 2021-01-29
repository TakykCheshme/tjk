import 'package:flutter/material.dart';
import 'package:tjk/models/attribute.dart';

import 'product.dart';

class CartItem {
  Product _product;
  Product get product => _product;

  int _count;
  int get count => _count;
  set count(int count) {
    if (count < 0) count = 0;
    _count = count;
  }

  Attribute attribute;

  CartItem({
    @required Product product,
    @required this.attribute,
    @required int count,
  }) {
    _product = product;
    _count = count;
  }

  bool operator ==(o) =>
      _product == o.product &&
      attribute.idProductAttribute == o.attribute.idProductAttribute;
}
