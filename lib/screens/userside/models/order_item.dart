import 'package:foodfast/screens/userside/models/cart_item.dart';

class OrderItem {
  late String userid;
  late Map<String,CartItem> cart;
  late DateTime datetime;
  late String type;
  OrderItem({
    required this.userid,
    required this.cart,
    required this.datetime,
    required this.type,
  });
}
