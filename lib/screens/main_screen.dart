// ignore_for_file: deprecated_member_use, unnecessary_new, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Mainwindowstate createState() => _Mainwindowstate();
}

class _Mainwindowstate extends State<MainScreen> {
  int index = 0;
  // Replace the bottom screens with other files.
  final screens = [
    Center(child: Text('A', style: TextStyle(fontSize: 72))),
    Center(child: Text('B', style: TextStyle(fontSize: 72))),
    Center(child: Text('C', style: TextStyle(fontSize: 72))),
    Center(child: Text('D', style: TextStyle(fontSize: 72)))
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        /*SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //Upper widget bar
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: const BoxDecoration(
                  color: Color(0xFFCE4135),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
              Container(
                //Upper widget bar
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
        ), 
        */
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Color(0xFFFF6939),
          ),
          child: NavigationBar(
            height: MediaQuery.of(context).size.height * 0.08,
            backgroundColor: Color(0xFFFEFFFE),
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => {this.index = index}),
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.favorite_border_outlined),
                  label: 'Favourites'),
              NavigationDestination(
                  icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
              NavigationDestination(
                  icon: Icon(Icons.account_circle_outlined), label: 'Profile')
            ],
          ),
        ),
      );
}
