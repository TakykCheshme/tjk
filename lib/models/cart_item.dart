import 'product.dart';

class CartItem {
  Product _product;
  Product get product => _product;

  int _count;
  int get count => _count;
  set count(int count) {
    if (count < 0) count = 0;
    _count = count;
  }

  String size;

  CartItem(Product product, this.size, int count) {
    _product = product;
    _count = count;
  }

  bool operator ==(o) => _product == o.product && size == o.size;
}
