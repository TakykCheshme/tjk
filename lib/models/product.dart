import 'package:hive/hive.dart';
import 'package:tjk/const.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  int _id;
  @HiveField(1)
  String _name;
  @HiveField(2)
  double _price;
  @HiveField(3)
  String _reference;
  @HiveField(4)
  String _brand;
  @HiveField(5)
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

  @override
  bool operator ==(o) => o.id == _id;
}
