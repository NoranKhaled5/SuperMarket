import 'package:ecomerceapi/model/product.dart';
import 'package:ecomerceapi/model/tag.dart';

class CartItem{
  Product product;
  Tag tag;
  int quantity;

  CartItem({required this.product, required this.tag, required this.quantity});
}