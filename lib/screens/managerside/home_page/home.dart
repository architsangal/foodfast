// ignore_for_file: sort_child_properties_last, unused_import, import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodfast/screens/userside/providers/products_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/products_grid.dart';

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
    // It will provie us total height  and width of our screen
    // it enable scrolling on small device
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductsGrid(),
          ],
        ),
      ),
    );
  }
}
