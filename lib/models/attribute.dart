import 'package:tjk/const.dart';

class Attribute {
  String _id;
  String _idProduct;
  String _value;
  String _color;
  String _name;
  String _idProductAttribute;

  String get id => _id;
  String get idProduct => _idProduct;
  String get value => _value;
  String get color => _color;
  String get name => _name;
  String get idProductAttribute => _idProductAttribute;

  Attribute({
    String id,
    String idProduct,
    String value,
    String color,
    String name,
    String idProductAttribute,
  }) {
    _id = id;
    _idProduct = idProduct;
    _value = value;
    _color = color;
    _name = name;
    _idProductAttribute = idProductAttribute;
  }

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['id'],
      idProduct: json['idProduct'],
      value: dashSlashRemover(json['value']),
      color: json['color'],
      name: json['name'],
      idProductAttribute: json['idProductAttribute'],
    );
  }
}
