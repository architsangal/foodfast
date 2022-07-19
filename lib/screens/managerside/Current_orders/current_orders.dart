// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';

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
        body: Column(
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
        
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(0, 2),
              ), //BoxShadow
              //BoxShadow
            ],
          ),
          // alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Card(
            color: Colors.white,
            //  elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.grey.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Green container at the middle of the top.
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: 34,
                      width: 98,
                      decoration: BoxDecoration(
                        color: Color(0xFF35BF7D),
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            blurRadius: 4.0,
                            spreadRadius: 0.0,
                            offset: Offset(0, 2),
                          ), //BoxShadow
                          //BoxShadow
                        ],
                      ),
                      child: Text(
                        "Active",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          //fontFamily: 'Ubuntu',
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Fried Rice",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "₹100",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "x3",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Fried Rice",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "₹100",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "x3",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Fried Rice",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "₹100",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "x3",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Fried Rice",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "₹100",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "x3",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Fried Rice",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "₹100",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "x3",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 70, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "₹1500",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
} /*   */
