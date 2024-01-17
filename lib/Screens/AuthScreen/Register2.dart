// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kafil/BussinessLogic/cubit/dependces_cubit.dart';
import 'package:kafil/BussinessLogic/cubit/dependces_state.dart';
import 'package:kafil/Models/Usertype.dart';

import 'package:kafil/Screens/AuthScreen/register.dart';
import 'package:kafil/BussinessLogic/cubit/register_cubit.dart';
import 'package:kafil/Models/Userdata.dart';

import 'package:kafil/consts/colors.dart';
import 'package:kafil/consts/strings.dart';
import 'package:easy_stepper/easy_stepper.dart';

class Register2 extends StatefulWidget {
  const Register2({Key? key}) : super(key: key);

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  bool isCameraReady = false;
  int sal = 0;
  final List<ApiTag> selectedTags = [];
  List<ApiTag> filteredTags = [];
  bool face = false;
  bool linked = false;
  bool twit = false;
  File? _image;
  String selectedGender = "";
  List<int> skills = [];

  List<String> Socials = [];

  final picker = ImagePicker();
  late List<CameraDescription> cameras;
  late CameraController _cameraController;

  TextEditingController notecon = TextEditingController();
  TextEditingController startdateinput = TextEditingController();
  final TextEditingController skillController = TextEditingController();

  var args;
  late final RegistrationCubit _registrationCubit;
  void initState() {
    super.initState();
    activeStep = 2;
    context.read<ApiCubit>().fetchData();
    _registrationCubit = RegistrationCubit();
    args = Get.arguments;
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    await _cameraController.initialize();
  }

  Future<void> _takePictureFromCamera() async {
    final XFile? imageFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50, // Adjust the quality as needed
    );

    if (imageFile != null) {
      _setImage(File(imageFile.path));
    }
  }

  Future<void> _pickImage() async {
    final XFile? imageFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      _setImage(File(imageFile.path));
    }
  }

  void _setImage(File image) {
    setState(() {
      _image = image;
    });
  }

  Future<void> _showImageOptions() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Take a picture'),
              onTap: () {
                Navigator.pop(context);
                _takePictureFromCamera();
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Pick from gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(args);
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
                              activeStep >= 1 ? Colors.green : Colors.white,
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
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showImageOptions();
                      },
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            child: _image == null
                                ? Image.asset(
                                    "assets/images/user.png",
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.fill,
                                  )
                                : null,
                            radius: 55,
                            backgroundImage:
                                _image != null ? FileImage(_image!) : null,
                          ),
                          Positioned(
                              top: 70,
                              child: (_image == null)
                                  ? Icon(
                                      Icons.add,
                                      size: 35,
                                      color: green,
                                    )
                                  : SizedBox())
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                      controller: notecon,
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
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: whiteColor),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (sal > 0) {
                                          sal = sal - 1000;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      size: 25,
                                    )),
                              ],
                            ),
                            Text(
                              "${sal}  SAR ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: darkFontGrey,
                                  fontSize: 17),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: whiteColor),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        sal = sal + 100;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      size: 25,
                                    )),
                              ],
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
                      controller: startdateinput,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          child: Icon(Icons.calendar_month, color: green),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1899),
                              lastDate: DateTime(3000),
                            );

                            if (pickedDate != null) {
                              startdateinput.text =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                            }
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
                          value: 'MALE',
                          groupValue: selectedGender,
                          activeColor: green,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value!;
                            });
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
                          value: 'FEMALE',
                          groupValue: selectedGender,
                          activeColor: green,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value!;
                              print(selectedGender);
                            });
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
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              BlocBuilder<ApiCubit, ApiState>(
                                builder: (context, state) {
                                  if (state is ApiLoaded) {
                                    List<ApiTag> allTags =
                                        (state as ApiLoaded).data.tags;

                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 5),
                                        TextFormField(
                                          controller: skillController,
                                          keyboardType: TextInputType.text,
                                          onChanged: (value) {
                                            setState(() {
                                              filteredTags = allTags
                                                  .where((tag) => tag.label
                                                      .toLowerCase()
                                                      .contains(
                                                          value.toLowerCase()))
                                                  .toList();
                                            });
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'Enter a skill',
                                            prefixIcon: Wrap(
                                              spacing: 4,
                                              runSpacing: 4.0,
                                              children: selectedTags
                                                  .map((tag) => Chip(
                                                        label: Text(
                                                          tag.label,
                                                          style: TextStyle(
                                                            color: green,
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                            lightGrey,
                                                        deleteIcon: Icon(
                                                            Icons.cancel,
                                                            color: green),
                                                        onDeleted: () {
                                                          setState(() {
                                                            selectedTags
                                                                .remove(tag);
                                                          });
                                                        },
                                                      ))
                                                  .toList(),
                                            ),
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 15.0,
                                                    horizontal: 7.0),
                                            filled: true,
                                            fillColor: Colors.grey[200],
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height:
                                              70, // Adjust the height as needed
                                          child: ListView.builder(
                                            itemCount: filteredTags.length,
                                            itemBuilder: (context, index) {
                                              ApiTag tag = filteredTags[index];
                                              return ListTile(
                                                title: Text(tag.label),
                                                onTap: () {
                                                  setState(() {
                                                    selectedTags.add(tag);
                                                    skills.add(tag.value);
                                                    skillController.clear();
                                                    filteredTags = [];
                                                  });
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                    BlocBuilder<ApiCubit, ApiState>(
                      builder: (context, state) {
                        if (state is ApiLoaded) {
                          List<ApiSocialMedia> allsocials =
                              state.data.socialMedia;

                          return Column(
                            children: allsocials.map((socialMedia) {
                              bool isSelected =
                                  Socials.contains(socialMedia.value);

                              return Row(
                                children: [
                                  Checkbox(
                                    value: isSelected,
                                    onChanged: (value) {
                                      setState(() {
                                        isSelected = value ?? false;
                                        if (isSelected) {
                                          Socials.add(socialMedia.value);
                                        } else {
                                          Socials.remove(socialMedia.value);
                                        }
                                      });
                                    },
                                  ),
                                  SizedBox(width: 5),
                                  Image.asset(
                                      "assets/images/${socialMedia.value}.png"),
                                  SizedBox(width: 5),
                                  Text(
                                    socialMedia.label,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: darkFontGrey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(green),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () async {
                          setState(() {
                            activeStep = 2;
                          });
                          print(skills);
                          print(Socials);
                          final user = UserModel(
                            firstName: args[0],
                            lastName: args[1],
                            about: notecon.text,
                            tags: skills ,
                            favoriteSocialMedia: Socials ,
                            salary: sal,
                            password: args[3],
                            email: args[2],
                            birthDate: startdateinput.text,
                            type: args[5],
                            avatarPath: _image!.path,
                            passwordConfirmation: args[4],
                          );

                
                          _registrationCubit.registerUser(user);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                          ),
                          child: Text(
                            reg,
                            style: TextStyle(fontSize: 18, color: whiteColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
