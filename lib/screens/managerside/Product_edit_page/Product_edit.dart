// ignore_for_file: unused_local_variable, file_names

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:foodfast/screens/managerside/Product_edit_page/Product_edit.dart';
import 'package:foodfast/screens/userside/models/product.dart';
// ignore: import_of_legacy_library_into_null_safe

class ProductEdit extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final id;

  const ProductEdit(this.id, {Key? key}) : super(key: key);
  String getid() {
    return id;
  }

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  @override
  Widget build(BuildContext context) {
    String currId = widget.id;

    Product p = Product(
        availability: 'available',
        category: 'Munchies',
        description: 'BBAA',
        id: 'PTEST',
        price: 12.5,
        title: 'TEST');
    return Container();
  }
}
