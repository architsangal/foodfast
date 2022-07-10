// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                      "Example Name",
                      style: const TextStyle(
                          color: Color(0xFF333333), fontSize: 16),
                    ),
                    // -------------------------------- Email Id-------------------------------- //
                    SizedBox(height: 2),
                    Text(
                      "examplename@gmail.com",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 11,
                      ),
                    ),
                    // -------------------------------- Monthly Expenditure -------------------------------- //
                    Divider(
                      thickness: 1,
                    ),
                    Text(
                      "This Months Expenditure",
                      style: const TextStyle(
                          color: Color(0xFF303030),
                          fontSize: 16,
                          fontFamily: 'Ubuntu'),
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
      ],
    ));
  }
}
