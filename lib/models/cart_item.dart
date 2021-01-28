import 'product.dart';

class CartItem {
  Product _product;
  Product get product => _product;

  int _count;
  int get count => _count;

  CartItem(Product product, int count) {
    _product = product;
    _count = count;
  }
}
