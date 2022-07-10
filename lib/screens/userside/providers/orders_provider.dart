import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';
import '../models/order_item.dart';

class OrdersProvider with ChangeNotifier {
  final List<OrderItem> _orders = [];

  // get all orders
  List<OrderItem> get orders {
    return [..._orders];
  }

// add a specific order to the global order list.
// We will take in the cart items and convert it into an order object and assign a type to it and add it to the global order list.
  void addOrder(List<CartItem> cartItems, double total) {
    // add order in the first List
    _orders.insert(
        0,
        OrderItem(
          dateTime: DateTime.now(),
          id: DateTime.now().toString(),
          amount: total,
          products: cartItems,
          type: "Active",
        ));
    notifyListeners();
  }
}
