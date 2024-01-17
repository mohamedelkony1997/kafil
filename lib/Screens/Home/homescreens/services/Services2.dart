// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil/BussinessLogic/cubit/services2cubit.dart';
import 'package:kafil/BussinessLogic/cubit/services2state.dart';

import 'package:kafil/consts/colors.dart';
import 'package:lottie/lottie.dart';

class Services2 extends StatelessWidget {
  const Services2({Key? key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
     
      child: BlocProvider(
        create: (context) => Product2Cubit()..fetchProducts2(),
        child: BlocBuilder<Product2Cubit, Product2State>(
            builder: (context, state) {
          if (state.isLoading) {
             return Center(
                      child: Lottie.asset(
                          "assets/images/animation_llaww8kk.json",
                          alignment: Alignment.center,
                          animate: true,
                          height: 100));
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: lightGrey),
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    product.mainImage,
                                    height: 120,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 5,
                                bottom: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: green,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "${product.price}\$",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: whiteColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          product.title,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkFontGrey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "(${product.averageRating}) |  ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.amber,
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.shopping_cart_checkout,
                            size: 20,
                            color: fontGrey,
                          ),
                          Text(
                            "${product.completedSalesCount}",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: fontGrey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
