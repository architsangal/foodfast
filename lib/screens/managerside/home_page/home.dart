// ignore_for_file: sort_child_properties_last, unused_import, import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodfast/screens/providers/products_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/products_grid.dart';
import 'package:flutter_switch/flutter_switch.dart';

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
  late bool store_open = true;
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    // it enable scrolling on small device
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Store',
                  style: TextStyle(fontSize: 25),
                ),
                FlutterSwitch(
                    toggleColor: Colors.white,
                    activeColor: const Color(0xFFE67F1F),
                    width: 90.0,
                    height: 35.0,
                    valueFontSize: 15.0,
                    toggleSize: 20.0,
                    value: store_open,
                    borderRadius: 30.0,
                    padding: 8.0,
                    activeText: "open",
                    activeTextColor: Colors.white,
                    inactiveText: "closed",
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        store_open = val;
                        Future<QuerySnapshot> querySnapshot = FirebaseFirestore
                            .instance
                            .collection('Essentials')
                            .get();
                        querySnapshot.then((QuerySnapshot query) {
                          for (var doc in query.docs) {
                            FirebaseFirestore.instance
                                .collection("Essentials")
                                .doc(doc.id)
                                .update({"store_open": val});
                          }
                        });
                      });
                    }),
              ],
            ),
            const ProductsGrid(),
          ],
        ),
      ),
    );
  }
}
