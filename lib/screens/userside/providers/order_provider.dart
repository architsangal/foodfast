import 'package:flutter/foundation.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/cart_item.dart';
import '../models/order_item.dart';

class OrderProvider with ChangeNotifier {
  late OrderItem order = OrderItem(
      userid: 'abc',
      cart: {},
      datetime: DateTime.utc(1969, 7, 20, 20, 18, 04),
      type: 'active');

  // get all orders
  Future<void> getorder() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('Orders')
        .doc('S2QUhdrBMiRAhc4J7XbI')
        .get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data();
      Timestamp t = data['datetime'];
      order.datetime =
          DateTime.fromMillisecondsSinceEpoch(t.millisecondsSinceEpoch);
      order.type = data['type'];
      order.userid = data['userid'];

      var cartData = data['cart'] as Map<String, dynamic>;
// Iterating through a map and parsing every
      cartData.forEach((key, value) {
        CartItem cata = CartItem.fromJson(value);
        order.cart.putIfAbsent(key, () => cata);
      });
    } else {}
    notifyListeners();
  }

  Future<void> postorder(OrderItem ord) async {
    order = ord;
    if (ord.cart.isNotEmpty) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Userdata')
          .doc('iU5AaoINM2UBnOHQ0Sep')
          .get();
      Map<String, dynamic> c = snapshot.data()['cart'];

      await FirebaseFirestore.instance.collection('Orders').add({
        'cart': c,
        'type': 'active',
        'userid': 'iU5AaoINM2UBnOHQ0Sep',
        'datetime': DateTime.now(),
      });
    }
  }

  double get totalPriceAmount {
    var total = 0.0;
    order.cart.forEach((key, cartitem) {
      total += cartitem.price * cartitem.quantity;
    });
    return total;
  }
}
