// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:foodfast/screens/providers/order_provider.dart';
import 'package:provider/provider.dart';

import '../../managerside/Profile/widgets/order_card.dart';
import '../models/order_item.dart';

class userProfilePage extends StatefulWidget {
  const userProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _userProfilePageState createState() => _userProfilePageState();
}

class _userProfilePageState extends State<userProfilePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<OrderProvider>(context).getorder();
    final orders = Provider.of<OrderProvider>(context);
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
              "User Info",
              style: TextStyle(
                color: Color(0xFF0A191E),
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
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
                padding: const EdgeInsets.all(12),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // -------------------------------- Name -------------------------------- //
                      Text(
                        "Test User",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // -------------------------------- Email Id-------------------------------- //
                      SizedBox(height: 2),
                      Text(
                        "testuser@iiitb.org",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                        ),
                      ),
                      // -------------------------------- Monthly Expenditure -------------------------------- //
                      Divider(
                        thickness: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 2, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "This Months Expenditure",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "₹4500",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
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
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: Text(
              "Your Orders",
              style: TextStyle(
                color: Color(0xFF0A191E),
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 28,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    // print(categories[index]);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xFF35BF7D),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text('Active',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF35BF7D),
                          )),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // print(categories[index]);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xFFFF6838),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text('Rejected',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFF6838),
                          )),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // print(categories[index]);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xFFFECE35),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text('Completed',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFECE35),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: orders.orders.length,
                  itemBuilder: (context, index) {
                    String key = orders.orders.keys.elementAt(index);
                    OrderItem order = orders.orders[key] as OrderItem;
                    return (Container(
                        child: (order.userid == "abc")
                            ? null
                            : (order.type == "completed")
                                ? OrderCard(
                                    userid: order.userid,
                                    cart: order.cart,
                                    datetime: order.datetime,
                                    type: order.type,
                                    total: 30.9)
                                : null));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
             /*  
             
             Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
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
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
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
             
             
             
             
             
             
             
             
             
             
              */