// ignore_for_file: sort_child_properties_last, prefer_const_constructors, curly_braces_in_flow_control_structures, annotate_overrides, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kafil/BussinessLogic/cubit/profile_cubit.dart';
import 'package:kafil/BussinessLogic/cubit/profile_state.dart';

import 'package:kafil/consts/colors.dart';
import 'package:kafil/consts/strings.dart';
import 'package:lottie/lottie.dart';

class WhoIam extends StatefulWidget {
  WhoIam({super.key});

  @override
  State<WhoIam> createState() => _WhoIamState();
}

class _WhoIamState extends State<WhoIam> {
  bool isSeen = true;

  bool face = false;
  bool linked = false;
  bool twit = false;

  String selectedGender = "";
  String selectedType = "";
  List<String> skills = [];
  List<String> Socials = [];

  void initState() {
    super.initState();
    context.read<UserDetailCubit>().getUserDetails();
  }

  DateTime? _startDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 20),
            child: BlocBuilder<UserDetailCubit, UserDetailState>(
              builder: (context, state) {
                if (state is UserDetailLoading) {
                  return Center(
                      child: Lottie.asset(
                          "assets/images/animation_llaww8kk.json",
                          alignment: Alignment.center,
                          animate: true,
                          height: 200));
                } else if (state is UserDetailLoaded) {
                  selectedType = state.userData.type.name;

                  twit = state.userData.favoriteSocialMedia.contains("x");
                  face =
                      state.userData.favoriteSocialMedia.contains("facebook");
                  linked =
                      state.userData.favoriteSocialMedia.contains("instagram");

                  return ListView(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        who,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: darkFontGrey,
                            fontSize: 28),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: CircleAvatar(
                        child: Image.network(
                          state.userData.avatar,
                          height: 80,
                          width: 80,
                          fit: BoxFit.fill,
                        ),
                        radius: 55,
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                fname,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: darkFontGrey,
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 150,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: state.userData.firstName,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.person,
                                      color: darkFontGrey,
                                    ),
                                  ),
                                  hintText: namehint,
                                  hintStyle: TextStyle(color: fontGrey),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 7.0),
                                  filled: true,
                                  fillColor: textfieldGrey,
                                ),
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter First name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                lname,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: darkFontGrey,
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 150,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: state.userData.lastName,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.person,
                                      color: darkFontGrey,
                                    ),
                                  ),
                                  hintText: lasthint,
                                  hintStyle: TextStyle(color: fontGrey),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 7.0),
                                  filled: true,
                                  fillColor: textfieldGrey,
                                ),
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Last name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        email,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkFontGrey,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      initialValue: state.userData.email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.email_outlined,
                            color: darkFontGrey,
                          ),
                        ),
                        hintText: emailHint,
                        hintStyle: TextStyle(color: fontGrey),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 7.0),
                        filled: true,
                        fillColor: textfieldGrey,
                      ),
                      onChanged: (value) {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        type,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkFontGrey,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Radio(
                          value: (state.userData.type.code == 1)
                              ? selectedType
                              : null,
                          groupValue: selectedType,
                          activeColor: green,
                          onChanged: (value) {
                            selectedType = value!;
                          },
                        ),
                        Text(
                          'Buyer',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkFontGrey,
                            fontSize: 16,
                          ),
                        ),
                        Radio(
                            value: (state.userData.type.code == 2)
                                ? selectedType
                                : null,
                            groupValue: selectedType,
                            activeColor: green,
                            onChanged: (value) {
                              selectedType = value!;
                            }),
                        Text(
                          'Seller',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkFontGrey,
                            fontSize: 16,
                          ),
                        ),
                        Radio(
                          value: (state.userData.type.code == 3)
                              ? selectedType
                              : null,
                          groupValue: selectedType,
                          activeColor: green,
                          onChanged: (value) {
                            selectedType = value!;
                          },
                        ),
                        Text(
                          'Both',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkFontGrey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        note,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkFontGrey,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      initialValue: state.userData.about,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "$note",
                        hintStyle: TextStyle(color: fontGrey),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 40.0, horizontal: 7.0),
                        filled: true,
                        fillColor: textfieldGrey,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter note';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        salary,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkFontGrey,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: textfieldGrey,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              " ${state.userData.salary}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: darkFontGrey,
                                  fontSize: 17),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        birth,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkFontGrey,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      showCursor: true,
                      readOnly: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Birth Day ';
                        }
                        return null;
                      },
                      initialValue: state.userData.birthDate,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          child: Icon(Icons.calendar_month, color: green),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: _startDate ?? DateTime.now(),
                              firstDate: DateTime(1899),
                              lastDate: DateTime(3000),
                            );
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: birth,
                        hintStyle: TextStyle(color: fontGrey),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 7.0),
                        filled: true,
                        fillColor: textfieldGrey,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        Gender,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkFontGrey,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Radio(
                          value: (state.userData.gender == 0) ? "Male" : null,
                          groupValue: "Male",
                          activeColor: green,
                          onChanged: (value) {
                            value = "Male";
                          },
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: darkFontGrey,
                              fontSize: 16),
                        ),
                        Radio(
                          value:
                              (state.userData.gender == 1) ? "Female" : null,
                          groupValue: "Female",
                          activeColor: green,
                          onChanged: (value) {
                            selectedGender = value = "Female";
                          },
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: darkFontGrey,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        skill1,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkFontGrey,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: skill1,
                        hintStyle: TextStyle(
                          color: fontGrey,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 35.0, horizontal: 7.0),
                        filled: true,
                        fillColor: textfieldGrey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Wrap(
                          spacing: 3.0,
                          children: state.userData.tags.map((tag) {
                            return Chip(
                              backgroundColor: lightGrey,
                              label: Text(
                                tag.name, 
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: green,
                                  fontSize: 13,
                                ),
                              ),
                              onDeleted: () {
                            
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        social,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkFontGrey,
                            fontSize: 16),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(value: twit, onChanged: (Value) {}),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset("assets/images/x.png"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          twitet,
                          style: TextStyle(
                              fontSize: 18,
                              color: darkFontGrey,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(value: face, onChanged: (Value) {}),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset("assets/images/facebook.png"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          facebook,
                          style: TextStyle(
                              fontSize: 18,
                              color: darkFontGrey,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(value: linked, onChanged: (Value) {}),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset("assets/images/instagram.png"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          linked1,
                          style: TextStyle(
                              fontSize: 18,
                              color: darkFontGrey,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ]);
                } else if (state is UserDetailError) {
                  return Text(state.errorMessage);
                } else {
                  return Text('Unhandled state');
                }
              },
            )),
      ),
    );
  }
}
