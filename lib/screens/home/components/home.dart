// ignore_for_file: sort_child_properties_last, unused_import, import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'header_with_seachbox.dart';

class Product {
  String name;
  String category;

  Product({required this.name, required this.category});
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int numberOfItems = 0;
  List<Product> items = [
    Product(name: 'Veg Noodles', category: "Chinese,North Indian"),
    Product(name: 'Chicken Manchurian', category: "Chinese,North Indian"),
    Product(name: 'Coca Cola', category: "Beverage"),
    Product(name: 'Pineapple Cake', category: "Cakes,Bakery"),
    Product(name: 'Lays Maxx', category: "Chips,Munchies")
  ];

  Widget personDetailCard(Product p) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
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
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        p.name,
                        style: const TextStyle(
                            color: Color(0xFF333333), fontSize: 16),
                      ),
                      Text(
                        p.category,
                        style: const TextStyle(
                            color: Color(0xFF707070), fontSize: 11),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "₹100",
                        style:
                            TextStyle(color: Color(0xFFE67F1F), fontSize: 16),
                      )
                    ],
                  )),
              const Spacer(),
              // The Below container widget is the "COUNTER WIDGET"..
              Container(
                height: 28,
                width: 85,
                padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: const Color(0xFFF8774A)),
                child: numberOfItems > 0
                    ? Row(
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
                                color: Colors.white,
                                size: 17,
                              )),
                          //  SizedBox(width: 17),
                          Text(
                            '$numberOfItems',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 17),
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
                                color: Colors.white,
                                size: 17,
                              )),
                        ],
                      )
                    : TextButton(
                        onPressed: () {
                          setState(() {
                            numberOfItems++;
                          });
                        },
                        child: const Text("ADD",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                        style: ButtonStyle(
                          shadowColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                            vertical: 2,
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFF9764A)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeaderWithSearchBox(size: size),
            Column(
                children: items.map((p) {
              return personDetailCard(p);
            }).toList()),
          ],
        ),
      ),
    );
  }
}
