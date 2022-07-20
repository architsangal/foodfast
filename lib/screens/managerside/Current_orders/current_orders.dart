// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:foodfast/screens/managerside/widgets/order_card.dart';

class CurrentOrdersPage extends StatefulWidget {
  const CurrentOrdersPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CurrentOrdersState createState() => _CurrentOrdersState();
}

class _CurrentOrdersState extends State<CurrentOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(15, 35, 10, 5),
            child: InkWell(
              onTap: () {
                // Do nothing for now
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: Text(
              "Current Orders",
              style: TextStyle(
                color: Color(0xFF0A191E),
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          order_card(),
          order_card(),
          order_card(),
              ],
            ),
        ));
  }
} /*   */
