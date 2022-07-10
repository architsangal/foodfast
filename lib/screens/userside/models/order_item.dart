import 'package:foodfast/screens/userside/models/cart_item.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  final String type;
  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
    required this.type,
  });
}
