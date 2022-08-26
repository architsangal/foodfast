import 'package:flutter/foundation.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodfast/screens/userside/models/cart_item.dart';
import 'package:foodfast/screens/userside/models/order_item.dart';

class OrderProvider with ChangeNotifier {
  late Map<String, OrderItem> orders = {
    'dummyorder': OrderItem(
        userid: 'abc',
        cart: {},
        datetime: DateTime.utc(1969, 7, 20, 20, 18, 04),
        type: 'active')
  };
  // get all orders
  Future<void> getorder() async {
    QuerySnapshot snapshots =
        await FirebaseFirestore.instance.collection('Orders').get();

    for (var doc in snapshots.docs) {
      var orderid = doc.id.toString();
      orders[orderid] = OrderItem(
          userid: 'abc',
          cart: {},
          datetime: DateTime.utc(1969, 7, 20, 20, 18, 04),
          type: 'active');

      Map<String, dynamic> data = doc.data();
      Timestamp t = data['datetime'];
      orders[orderid]!.datetime =
          DateTime.fromMillisecondsSinceEpoch(t.millisecondsSinceEpoch);
      orders[orderid]!.type = data['type'];
      orders[orderid]!.userid = data['userid'];

      var cartData = data['cart'] as Map<String, dynamic>;
// Iterating through a map and parsing every
      cartData.forEach((key, value) {
        CartItem cata = CartItem.fromJson(value);
        orders[orderid]!.cart.putIfAbsent(key, () => cata);
      });
    }

    notifyListeners();
  }

  Future<void> postorder(OrderItem ord) async {
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

//   double get totalPriceAmount {
//     var total = 0.0;
//     order.cart.forEach((key, cartitem) {
//       total += cartitem.price * cartitem.quantity;
//     });
//     return total;
//   }
}
