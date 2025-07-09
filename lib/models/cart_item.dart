import 'product.dart';
class CartItem {
  Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}