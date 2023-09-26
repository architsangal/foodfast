import 'package:flutter/material.dart';
import 'package:foodfast/screens/providers/cart_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class OrderItemWidget extends StatelessWidget {
  final String productId;
  final double price;
  final int quantity;
  final String title;

  const OrderItemWidget({
    Key? key,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              SizedBox(
                  width: 85,
                  child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: const TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // Insert coutner here.
                        ],
                      ))),
              const Spacer(),
              Consumer<CartProvider>(
                builder: (BuildContext context, CartProvider cart, _) {
                  return Container(
                    height: 28,
                    width: 85,
                    padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: const Color(0xFFF9774B),
                          style: BorderStyle.solid,
                        ),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceAround, // use whichever suits your need

                      children: [
                        InkWell(
                            onTap: () {
                              cart.decreaseNumberOfProductsInCartItem(
                                  productId);
                              if (cart.numberOfProductsInSingleItem(
                                      productId) ==
                                  0) {
                                cart.removeItemFromCart(productId);
                                cart.helperfunction(productId);
                              }
                            },
                            child: const Icon(
                              Icons.remove,
                              color: Color(0xFFF9774B),
                              size: 17,
                            )),
                        //  SizedBox(width: 17),
                        Text(
                          quantity.toString(),
                          style: const TextStyle(
                            color: Color(0xFFF9774B),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        //  SizedBox(width: 17),
                        InkWell(
                            onTap: () {
                              cart.increaseNumberOfProductsInCartItem(
                                  productId);
                            },
                            child: const Icon(
                              Icons.add,
                              color: Color(0xFFF9774B),
                              size: 17,
                            )),
                      ],
                    ),
                  );
                },
              ),
              const Spacer(),
              Text(
                price.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // The Below container widget is the "COUNTER WIDGET"..
            ],
          ),
        ),
      ),
    );
  }
}
