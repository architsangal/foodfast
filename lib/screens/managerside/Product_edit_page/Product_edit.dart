import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodfast/screens/managerside/home_page/home.dart' as homepage;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../userside/models/product.dart';


class ProductEdit extends StatelessWidget {
  const ProductEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const homepage.Home()));
            },
            icon: const Icon(Icons.arrow_back_ios)),

      ],
    ));
  }
}
