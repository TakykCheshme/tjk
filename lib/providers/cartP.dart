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

  void removeAt(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void increaseAt(int index) {
    _items[index].count = _items[index].count + 1;
    notifyListeners();
  }

  void decreaseAt(int index) {
    _items[index].count = _items[index].count - 1;
    notifyListeners();
  }
}
