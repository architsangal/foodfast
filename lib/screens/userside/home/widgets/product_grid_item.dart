import 'package:flutter/material.dart';
import 'package:foodfast/screens/providers/cart_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

import '../../models/product.dart';

class ProductGridItem extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final index;

  const ProductGridItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //  color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Card(
          color: Colors.white,
          //  elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Colors.grey.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // -------------------------------- Title in product card -------------------------------- //

                        Text(
                          product.title,
                          style: const TextStyle(
                              color: Color(0xFF333333), fontSize: 16),
                        ),
                        // -------------------------------- Category in product card -------------------------------- //

                        Text(
                          product.category,
                          style: const TextStyle(
                              color: Color(0xFF707070), fontSize: 11),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // -------------------------------- Price in product card -------------------------------- //

                        Text(
                          product.price.toString(),
                          style: const TextStyle(
                              color: Color(0xFFE67F1F), fontSize: 16),
                        )
                      ],
                    )),
                const Spacer(),
                // -------------------------------- FOOTER(COUNTER WIDGET PART OF THE PRODUCT CARD) -------------------------------- //
                Consumer<CartProvider>(
                  builder: (BuildContext context, CartProvider cart, _) {
                    return Container(
                      height: 28,
                      width: 85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: const Color(0xFFF8774A)),
                      child: cart.checkProductAddedToCart(product.id)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceAround, // use whichever suits your need

                              // use whichever suits your need
                              children: [
                                InkWell(
                                    onTap: () {
                                      cart.decreaseNumberOfProductsInCartItem(
                                          product.id);
                                      if (cart.numberOfProductsInSingleItem(
                                              product.id) ==
                                          0) {
                                        cart.removeItemFromCart(product.id);
                                        cart.helperfunction(product.id);
                                      }
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 17,
                                    )),
                                //  SizedBox(width: 17),
                                Text(
                                  cart
                                      .numberOfProductsInSingleItem(product.id)
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                //  SizedBox(width: 17),
                                InkWell(
                                    onTap: () {
                                      cart.increaseNumberOfProductsInCartItem(
                                          product.id);
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 17,
                                    )),
                              ],
                            )
                          : TextButton(
                              onPressed: () {
                                cart.addItemToCart(
                                    product.id, product.title, product.price);
                              },
                              style: ButtonStyle(
                                shadowColor: MaterialStateProperty.all<Color>(
                                    Colors.black),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                  vertical: 2,
                                )),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xFFF9764A)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                              child: const Text("ADD",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
