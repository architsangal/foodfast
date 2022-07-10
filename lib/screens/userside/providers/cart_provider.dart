import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  // Every cartItem have unique id not the id of product
  // Map<key, value> => key will be the id of the CartItem.
  // Global list for a specific user that keeps track of all the cart items.
  Map<String, CartItem> _cartItems = {};

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

  void increaseNumberOfProductsInCartItem(String productId) {
    _cartItems.update(
        productId,
        (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1,
            ));
    notifyListeners();
  }

  void decreaseNumberOfProductsInCartItem(String productId) {
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
    notifyListeners();
  }

  void addItemToCart(String productId, String title, double price) {
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
