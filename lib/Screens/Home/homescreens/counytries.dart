// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil/BussinessLogic/cubit/countries_cubit.dart';
import 'package:kafil/BussinessLogic/cubit/countries_state.dart';
import 'package:kafil/consts/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:number_paginator/number_paginator.dart';

class Countries extends StatefulWidget {
  Countries({super.key});

  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  var selectedPageNumber = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Countries",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: darkFontGrey,
                      fontSize: 28),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Country',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Capital',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BlocProvider(
                create: (context) => CountryCubit()..getCountries(),
                child: BlocBuilder<CountryCubit, CountryState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Center(
                            child: Lottie.asset(
                                "assets/images/animation_llaww8kk.json",
                                alignment: Alignment.center,
                                
                                animate: true,
                                height: 200)),
                      );
                    } else {
                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 1.8,
                            child: ListView.builder(
                              itemCount: state.countries.length,
                              itemBuilder: (context, index) {
                                final country = state.countries[index];
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            country.name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey[600],
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            country.capital,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey[600],
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          NumberPaginator(
                            numberPages:
                                state.totalPages > 0 ? state.totalPages : 1,
                            onPageChange: (int index) {
                              setState(() {
                                selectedPageNumber = index + 1;
                              });
                              context
                                  .read<CountryCubit>()
                                  .getCountries(page: selectedPageNumber);
                            },
                            initialPage: selectedPageNumber - 1,
                            config: NumberPaginatorUIConfig(
                              height: 40,
                              buttonShape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              buttonSelectedForegroundColor: green,
                              buttonUnselectedForegroundColor: Colors.white,
                              buttonUnselectedBackgroundColor: Colors.grey,
                              buttonSelectedBackgroundColor: green,
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
