// ignore_for_file: deprecated_member_use, unnecessary_new, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:foodfast/screens/userside/Cart/cart_page.dart';
import 'package:foodfast/screens/userside/Profile/user_profile_page.dart';
import 'package:foodfast/screens/userside/home/components/home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Mainwindowstate createState() => _Mainwindowstate();
}

class _Mainwindowstate extends State<MainScreen> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  void onPageChanged(int page) {
    setState(() {
      _selectedIndex = page;
    });
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        // ignore: sort_child_properties_last
        children: <Widget>[
          Home(),
          CartPage(),
          userProfilePage(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_rounded,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFFFF6939),
        onTap: _onItemTapped,
      ),
    );
  }
}
