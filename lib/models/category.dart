import 'product.dart';

class Category {
  int _id;
  String _name;
  List<Product> _products;

  int get id => _id;
  String get name => _name;
  List<Product> get products => _products;

  Category({
    int id,
    String name,
    List<dynamic> products,
  }) {
    _id = id;
    _name = name;
    _products = products
        .map((e) => Product(
              id: int.parse(e["id"]),
              name: e["name"],
              price: double.parse(e["price"]),
              reference: e["reference"],
              brand: e["brand"],
              cover: e["cover"],
            ))
        .toList();
  }
}
