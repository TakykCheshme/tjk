import 'package:tjk/const.dart';

class Product {
  int _id;
  String _name;
  double _price;
  String _reference;
  String _brand;
  String _cover;

  int get id => _id;
  String get name => _name;
  double get price => _price;
  String get reference => _reference;
  String get brand => _brand;
  String get cover => _cover;

  Product({
    int id,
    String name,
    double price,
    String reference,
    String brand,
    String cover,
  }) {
    _id = id;
    _name = name;
    _price = price;
    _reference = reference;
    _brand = brand;
    _cover = getCoverById(cover);
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: int.parse(json["id"]),
      name: json["name"],
      price: double.parse(json["price"]),
      reference: json["reference"],
      brand: json["brand"],
      cover: json["cover"],
    );
  }
}
