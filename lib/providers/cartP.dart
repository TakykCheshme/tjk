import 'package:flutter/material.dart';
import 'package:tjk/models/attribute.dart';
import 'package:tjk/models/cart_item.dart';
import 'package:tjk/models/product.dart';

enum PaymentMethod { nagt, kart, online }

class CartP extends ChangeNotifier {
  List<CartItem> _items = [];
  List<CartItem> get items => _items;

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;

  void _calculateTotalPrice() {
    _totalPrice = 0;
    for (CartItem item in _items)
      _totalPrice += item.product.price * item.count;
  }

  void add({
    @required Product product,
    @required Attribute attribute,
    @required int count,
  }) {
    CartItem item = CartItem(
      product: product,
      attribute: attribute,
      count: count,
    );
    if (!_items.contains(item))
      _items.add(item);
    else
      _items.firstWhere((i) => i == item).count++;

    _calculateTotalPrice();
    notifyListeners();
  }

  void removeAt(int index) {
    _items.removeAt(index);
    _calculateTotalPrice();
    notifyListeners();
  }

  void clear() {
    _items.clear();
    _calculateTotalPrice();
    notifyListeners();
  }

  void increaseAt(int index) {
    _items[index].count = _items[index].count + 1;
    _calculateTotalPrice();
    notifyListeners();
  }

  void decreaseAt(int index) {
    _items[index].count = _items[index].count - 1;
    _calculateTotalPrice();
    notifyListeners();
  }

  PaymentMethod _paymentMethod;
  PaymentMethod get paymentMethod => _paymentMethod;
  set paymentMethod(PaymentMethod paymentMethod) {
    _paymentMethod = paymentMethod;
    notifyListeners();
  }
}
