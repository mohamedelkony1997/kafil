// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:kafil/Screens/Home/homescreens/Profile.dart';

import 'package:kafil/Screens/Home/homescreens/counytries.dart';
import 'package:kafil/Screens/Home/homescreens/services/services.dart';
import 'package:kafil/consts/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
          Icon(
            Icons.person,
            color: whiteColor,
          ),
          ImageIcon(
            AssetImage("assets/images/countries.png"),
            color: whiteColor,
          ),
          ImageIcon(
            AssetImage("assets/images/shopping-cart.png"),
            color: whiteColor,
          ),
        ],
        inactiveIcons: [
          Text(
            "WhoIAm",
            style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
            "Countries",
            style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
            "Services",
            style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
        color: green,
        height: 60,
        circleWidth: 60,
        activeIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
          pageController.jumpToPage(_tabIndex);
        },
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: green,
        elevation: 10,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          setState(() {
            _tabIndex = v;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: WhoIam(),
          ),
          Countries(),
          Services(),
        ],
      ),
    );
  }
}
