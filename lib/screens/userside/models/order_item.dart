import 'package:foodfast/screens/userside/models/cart_item.dart';

class OrderItem {
  late final String userid;
  final Map<String,CartItem> cart;
  late final DateTime datetime;
  late final String type;
  OrderItem({
    required this.userid,
    required this.cart,
    required this.datetime,
    required this.type,
  });
}
