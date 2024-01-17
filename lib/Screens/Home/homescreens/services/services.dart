// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kafil/Screens/Home/homescreens/services/Services2.dart';
import 'package:kafil/Screens/Home/homescreens/services/services1.dart';
import 'package:kafil/consts/colors.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Services",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: darkFontGrey,
                fontSize: 28,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Services1(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Popular Services",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: darkFontGrey,
                fontSize: 28,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Services2(),
        ]),
      ),
    ));
  }
}
