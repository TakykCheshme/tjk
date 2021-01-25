class Product {
  int _id;
  String _name;
  double _price;
  String _reference;
  String _brand;
  String _cover;

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
    _cover = cover;
  }

  int get id => _id;
  String get name => _name;
  double get price => _price;
  String get reference => _reference;
  String get brand => _brand;
  String get cover => _cover;
}
