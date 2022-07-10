// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  // Every cartItem have unique id not the id of product
  // Map<key, value> => key will be the id of the CartItem.
  // Global list for a specific user that keeps track of all the cart items.
  Map<String, CartItem> _cartItems = {};
// The map that stores the entire cart as a map of objects that are accessed by the product id of a specific item.
  Future<void> getcart() async {
    // This function will intitialise the local cart object from the one that is pulled from the database at the time of login.
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('Userdata')
        .doc('iU5AaoINM2UBnOHQ0Sep')
        .get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      // Now we have the cart object and we should load it into the local map available.
      var categoriesData = data['cart'] as Map<String, dynamic>;
// Iterating through a map and parsing every
      categoriesData.forEach((key, value) {
        CartItem cata = CartItem.fromJson(value);
        _cartItems.putIfAbsent(key, () => cata);
      });
    }
    notifyListeners();
  }

  // getter to get cart items
  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  // getter to get cart items count
  int get itemsCount {
    int itc = 0;
    _cartItems.forEach((key, cardItem) {
      itc += cardItem.quantity;
    });
    return itc;
  }

  // gives us the total bill amount for all the items in the cart.
  double get totalPriceAmount {
    var total = 0.0;
    _cartItems.forEach((key, cardItem) {
      total += cardItem.price * cardItem.quantity;
    });
    return total;
  }

// will check if a specific product is added to the cart or not by using the product id.
  bool checkProductAddedToCart(productId) {
    if (_cartItems.containsKey(productId)) {
      return true;
    } else {
      return false;
    }
  }

  int numberOfProductsInSingleItem(String productId) {
    var cartItem =
        _cartItems.values.firstWhere((cartItem) => cartItem.id == productId);
    return cartItem.quantity;
  }

  Future<void> increaseNumberOfProductsInCartItem(String productId) async {
    _cartItems.update(
        productId,
        (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1,
            ));
// Update the cart entry in the local map and the firebase database too.

    await FirebaseFirestore.instance
        .collection('Userdata')
        .doc('iU5AaoINM2UBnOHQ0Sep')
        .update({
      'cart': {
        productId: {
          productId,
          _cartItems[productId]!.title,
          _cartItems[productId]!.quantity,
          _cartItems[productId]!.price
        }.toList(),
      }
    });
    notifyListeners();
  }

  Future<void> decreaseNumberOfProductsInCartItem(String productId) async {
    _cartItems.update(
        productId,
        (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: (existingCartItem.quantity == 0)
                  ? 0
                  : existingCartItem.quantity - 1,
            ));
// Update the cart entry in the local map and the firebase database too.
    await FirebaseFirestore.instance
        .collection('Userdata')
        .doc('iU5AaoINM2UBnOHQ0Sep')
        .update({
      'cart': {
        productId: {
          productId,
          _cartItems[productId]!.title,
          _cartItems[productId]!.quantity,
          _cartItems[productId]!.price
        }.toList(),
      }
    });
    notifyListeners();
  }

  Future<void> addItemToCart(
      String productId, String title, double price) async {
    // Check if cart contain product
    if (_cartItems.containsKey(productId)) {
      // Increase quantity
      _cartItems.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
              ));
      await FirebaseFirestore.instance
          .collection('Userdata')
          .doc('iU5AaoINM2UBnOHQ0Sep')
          .update({
        'cart': {
          productId: {productId, title, _cartItems[productId]!.quantity, price}
              .toList(),
        }
      });
    } else {
      // Add product to cart
      _cartItems.putIfAbsent(
          productId,
          () => CartItem(
                id: productId,
                title: title,
                quantity: 1,
                price: price,
              ));
      await FirebaseFirestore.instance
          .collection('Userdata')
          .doc('iU5AaoINM2UBnOHQ0Sep')
          .set({
        'cart': {
          productId: {productId, title, 1, price}.toList(),
        }
      }, SetOptions(merge: true));
    }

    notifyListeners();
  }

  void removeItemFromCart(String itemId) {
    _cartItems.remove(itemId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems = {};
    notifyListeners();
  }
}
