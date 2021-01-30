import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tjk/language.dart';
import 'package:tjk/models/attribute.dart';
import 'package:tjk/models/cart_item.dart';
import 'package:tjk/models/product.dart';
import 'package:tjk/providers/accountP.dart';
import 'package:tjk/services.dart/network.dart';

enum PaymentMethod { nagt, kart, online }

class CartP extends ChangeNotifier {
  Box box;

  bool _loading = false;
  bool get loading => _loading;

  String _error;
  String get error => _error;

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

  Future<int> checkout() async {
    _loading = true;
    notifyListeners();

    List<Map<String, dynamic>> orders = _items
        .map<Map<String, dynamic>>((item) => {
              "id": item.product.id,
              "count": item.count,
              "name": item.product.name,
              "price": item.product.price,
              "product_attribute_id": item.attribute.idProductAttribute,
            })
        .toList();

    String description = "";
    for (CartItem item in _items)
      description +=
          "${item.count}x${item.product.price}m. ${item.product.name} (artikul: ${item.product.reference}, olcheg: ${item.attribute.value})\n";

    List<Map<String, dynamic>> note = _items
        .map((item) => {
              "count": item.count,
              "cover": item.product.cover.split("/").last.split(".").first,
              "price": item.product.price,
              "title":
                  "${item.count}x - ${item.product.reference} olcheg:${item.attribute.value}",
            })
        .toList();

    int result = await Network().orderCreate(
      language: _ln,
      address: "Ady: " + account.name + ", Salgysy: " + account.address,
      phone: account.phone,
      totalPaid: _totalPrice,
      paymentMethod: _paymentMethod.toString().split(".").last,
      orders: jsonEncode(orders),
      description: description,
      note: jsonEncode(note),
    );
    _loading = false;
    if (result == null) {
      _error = "no internet";
      notifyListeners();
      return 0;
    } else {
      _error = null;
      notifyListeners();
      return result;
    }
  }

  String _ln;
  String get ln => _ln;
  set ln(String ln) {
    _ln = ln;
    notifyListeners();
  }

  AccountP account;
}
