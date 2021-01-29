import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AccountP extends ChangeNotifier {
  Box box;

  bool _isEditing = false;
  bool get isEditing => _isEditing;
  set isEditing(bool isEditing) {
    _isEditing = isEditing;
    notifyListeners();
  }

  String _name;
  String get name => _name;
  set name(String name) {
    _name = name;
    box.put("name", name);
    notifyListeners();
  }

  String _address;
  String get address => _address;
  set address(String address) {
    _address = address;
    box.put("address", address);
    notifyListeners();
  }

  String _phone;
  String get phone => _phone;
  set phone(String phone) {
    _phone = phone;
    box.put("phone", phone);
    notifyListeners();
  }

  AccountP() {
    box = Hive.box("tjk");
    _name = box.get("name", defaultValue: "");
    _address = box.get("address", defaultValue: "");
    _phone = box.get("phone", defaultValue: "");
    if (_name.isEmpty && _address.isEmpty && _phone.isEmpty) _isEditing = true;
    notifyListeners();
  }
}
