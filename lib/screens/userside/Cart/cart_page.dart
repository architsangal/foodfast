// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodfast/screens/userside/Cart/widgets/cart_item_widget.dart';
import 'package:foodfast/screens/userside/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CartPageState createState() => _CartPageState();
}

class Product {
  String name;
  String category;

  Product({required this.name, required this.category});
}

class _CartPageState extends State<CartPage> {
  int numberOfItems = 0;

  List<Product> items = [
    Product(name: 'Veg Noodles', category: "Chinese,North Indian"),
    Product(name: 'Fried Rice', category: "Chinese,North Indian"),
    Product(name: 'Coca Cola', category: "Beverage"),
    Product(name: 'Pineapple Cake', category: "Cakes,Bakery"),
    Product(name: 'Lays Maxx', category: "Chips,Munchies"),
    Product(name: 'Chicken Manchurian', category: "Chinese,North Indian"),
    Product(name: 'Chicken Manchurian', category: "Chinese,North Indian"),
    Product(name: 'Gobi Manchurian', category: "Chinese,North Indian"),
  ];
  Widget personDetailCard(Product p) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              Container(
                  width: 85,
                  child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            p.name,
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
              Spacer(),
              Container(
                  height: 28,
                  width: 85,
                  padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Color(0xFFF9774B),
                        style: BorderStyle.solid,
                      ),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceAround, // use whichever suits your need

                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              numberOfItems--;
                            });
                          },
                          child: const Icon(
                            Icons.remove,
                            color: Color(0xFFF9774B),
                            size: 17,
                          )),
                      //  SizedBox(width: 17),
                      Text(
                        '$numberOfItems',
                        style: TextStyle(
                          color: Color(0xFFF9774B),
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      //  SizedBox(width: 17),
                      InkWell(
                          onTap: () {
                            setState(() {
                              numberOfItems++;
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            color: Color(0xFFF9774B),
                            size: 17,
                          )),
                    ],
                  )),
              Spacer(),
              const Text(
                "₹100",
                style: TextStyle(
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

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

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
                  onPressed: () {},
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
