// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:kafil/Screens/AuthScreen/Register2.dart';
import 'package:kafil/BussinessLogic/cubit/dependces_cubit.dart';
import 'package:kafil/BussinessLogic/cubit/dependces_state.dart';

import 'package:kafil/BussinessLogic/cubit/register_cubit.dart';
import 'package:kafil/Models/Userdata.dart';
import 'package:kafil/Models/Usertype.dart';

import 'package:kafil/consts/colors.dart';
import 'package:kafil/consts/strings.dart';
import 'package:easy_stepper/easy_stepper.dart';

int activeStep = 1;
var obj = [];

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isSeen = true;
  bool isSeen1 = true;
  bool isCameraReady = false;
  int? typestr;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  void initState() {
    super.initState();

    context.read<ApiCubit>().fetchData();
    // Set activeStep to 0 when the widget is initialized
    activeStep = 1;
  }

  @override
  void dispose() {
    firstname.dispose();
    lastname.dispose();
    emailCon.dispose();
    passwordCon.dispose();
    passwordConfirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 5, right: 2, left: 2),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 2, left: 2),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      reg,
                      style: TextStyle(
                        color: darkFontGrey,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              EasyStepper(
                activeStep: activeStep,
                lineStyle: LineStyle(
                  lineSpace: 5,
                  lineLength: 150,
                  lineType: LineType.normal,
                  defaultLineColor: Colors.white,
                  finishedLineColor: green,
                ),
                activeStepTextColor: Colors.black87,
                finishedStepTextColor: Colors.black87,
                internalPadding: 10,
                showLoadingAnimation: false,
                stepRadius: 12,
                showStepBorder: false,
                steps: [
                  EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor:
                              activeStep >= 0 ? Colors.green : Colors.white,
                        ),
                      ),
                      title: 'register',
                      topTitle: true),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor:
                            activeStep >= 1 ? Colors.green : Colors.white,
                      ),
                    ),
                    title: 'Complete data',
                    topTitle: true,
                  ),
                ],
                onStepReached: (index) => setState(() => activeStep = index),
              ),
              // First Step: Display 5 TextFormFields and a Button

              Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: Column(
                    children: [
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
                                  controller: firstname,
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
                                  onChanged: (value) {
                                    obj.add(value);
                                  },
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
                                  controller: lastname,
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
                                  onChanged: (value) {
                                    obj.add(value);
                                  },
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
                        controller: emailCon,
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
                        onChanged: (value) {
                          obj.add(value);
                        },
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
                          password,
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
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordCon,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.password,
                                color: darkFontGrey,
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isSeen = !isSeen;
                                });
                              },
                              child: Icon(isSeen
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 6.0),
                            hintText: "$password",
                            hintStyle: TextStyle(color: fontGrey),
                            filled: true,
                            fillColor: textfieldGrey),
                        onChanged: (value) {
                          obj.add(value);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        obscureText: isSeen,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "$confirmpassword",
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
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordConfirm,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.password,
                                color: darkFontGrey,
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isSeen1 = !isSeen1;
                                });
                              },
                              child: Icon(isSeen1
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 6.0),
                            hintText: confirmpassword,
                            hintStyle: TextStyle(color: fontGrey),
                            filled: true,
                            fillColor: textfieldGrey),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          obj.add(value);
                        },
                        obscureText: isSeen1,
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
                      BlocBuilder<ApiCubit, ApiState>(
                        builder: (context, state) {
                          if (state is ApiLoaded) {
                            // Access the data using state.data
                            return DropdownButtonFormField<ApiType>(
                              value: state.data.types[
                                  0], // Replace with the actual property in ApiData
                              isExpanded: false,
                              items: state.data.types.map((type1) {
                                return DropdownMenuItem<ApiType>(
                                  value: type1,
                                  child: Text(type1.label),
                                );
                              }).toList(),
                              onChanged: (value) {
                                typestr = value!.value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: textfieldGrey,
                                hintText: select,
                                hintStyle: TextStyle(color: fontGrey),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 6.0,
                                ),
                              ),
                            );
                          } else if (state is ApiError) {
                            return Text("Error: ${state.error}");
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              minimumSize:
                                  MaterialStateProperty.all(Size(150, 50)),
                              backgroundColor: MaterialStateProperty.all(green),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () async {
                              setState(() {
                                activeStep = 2;

                                Get.to(Register2(), arguments: [
                                  firstname.text,
                                  lastname.text,
                                  emailCon.text,
                                  passwordCon.text,
                                  passwordConfirm.text,
                                  typestr
                                ]);
                                print(typestr);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                              ),
                              child: Text(
                                next,
                                style:
                                    TextStyle(fontSize: 18, color: whiteColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              // Second Step: Display 5 TextFormFields
            ],
          ),
        ),
      ),
    );
  }
}
