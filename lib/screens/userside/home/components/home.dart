// ignore_for_file: sort_child_properties_last, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:foodfast/screens/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/products_grid.dart';
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
  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context).getcart();
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          const SingleChildScrollView(
            child: ProductsGrid(),
          )
        ],
      ),
    );
  }
}
