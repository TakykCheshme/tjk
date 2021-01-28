import 'package:flutter/material.dart';
import 'package:tjk/models/cart_item.dart';
import 'package:tjk/models/product.dart';

class CartP extends ChangeNotifier {
  List<CartItem> _items = [];
  List<CartItem> get items => _items;

  int _totalPrice;
  int get totalPrice => _totalPrice;

  void add(Product product, int count) {
    CartItem item = CartItem(product, count);
    _items.add(item);
    print(_items);
    notifyListeners();
  }
}
