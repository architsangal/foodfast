// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, import_of_legacy_library_into_null_safe

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodfast/screens/providers/order_provider.dart';
import 'package:foodfast/screens/userside/Cart/widgets/cart_item_widget.dart';
import 'package:foodfast/screens/userside/models/order_item.dart';
import 'package:foodfast/screens/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final acart = Provider.of<CartProvider>(context).cartItems;
    return Scaffold(
        body: Column(children: [
      Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.26,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/blurred_pizza.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 140,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          Positioned(
            top: 160,
            left: 20,
            child: Row(
              children: [
                Text(
                  "Your Order",
                  style: const TextStyle(
                      fontSize: 23,
                      color: Color(0xFF0A191E),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Ubuntu'),
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 23,
                ),
                SizedBox(width: 3),
                Text(cart.itemsCount.toString()),
              ],
            ),
          ),
        ],
      ),
      Expanded(
        //  scrollDirection: Axis.vertical,
        child: Card(
          margin: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          color: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Colors.grey.withOpacity(0.2),
              width: 1,
            ),
          ),
          shadowColor: Colors.black,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: cart.cartItems.length,
              itemBuilder: (ctx, i) => CartItemWidget(
                productId: cart.cartItems.values.toList()[i].id,
                price: cart.cartItems.values.toList()[i].price,
                quantity: cart.cartItems.values.toList()[i].quantity,
                title: cart.cartItems.values.toList()[i].title,
              ),
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
          ),
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.18,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
            bottom: Radius.circular(0),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Total",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Text(
                    cart.totalPriceAmount.toStringAsFixed(2),
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF97648),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    OrderItem ord = OrderItem(
                        userid: 'abc',
                        cart: acart,
                        datetime: DateTime.now(),
                        type: 'active');
                    Provider.of<OrderProvider>(context, listen: false)
                        .postorder(ord);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Place Order',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ), // <-- Text
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        // <-- Icon
                        CupertinoIcons.arrow_right,
                        size: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
