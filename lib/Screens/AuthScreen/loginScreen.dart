// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:kafil/BussinessLogic/cubit/login_cubit.dart';
import 'package:kafil/Screens/AuthScreen/register.dart';
import 'package:kafil/Screens/Home/HomePage.dart';
import 'package:kafil/consts/colors.dart';
import 'package:kafil/consts/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../consts/styles.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailCon = TextEditingController();

  TextEditingController passwordCon = TextEditingController();
  late LoginCubit _loginCubit;
  bool forgot = false;
  bool isSeen = true;
  @override
  void initState() {
    super.initState();
    _loginCubit = LoginCubit();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key:_formKey ,
          child: ListView(physics: AlwaysScrollableScrollPhysics(), children: [
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
                    acount_login,
                    style: TextStyle(
                        color: darkFontGrey,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Center(
                child: Image(
              image: AssetImage("assets/images/login.png"),
              width: 280,
              height: 230,
            )),
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18.0, horizontal: 7.0),
                filled: true,
                fillColor: textfieldGrey,
              ),
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
                    child: Icon(isSeen ? Icons.visibility_off : Icons.visibility),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18.0, horizontal: 6.0),
                  hintText: "$password",
                  hintStyle: TextStyle(color: fontGrey),
                  filled: true,
                  fillColor: textfieldGrey),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
              obscureText: isSeen,
            ),
            Row(
              children: [
                Checkbox(
                    value: forgot,
                    onChanged: (Value) {
                      setState(() {
                        forgot = Value ?? false;
                      });
                    }),
                Text(
                  remember,
                  style: TextStyle(
                      fontSize: 14,
                      color: darkFontGrey,
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text(
                  forgPassword,
                  style: TextStyle(
                      fontSize: 14,
                      color: darkFontGrey,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(Size(300, 50)),
                backgroundColor: MaterialStateProperty.all(green),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () async {
               if (_formKey.currentState!.validate()) {
                      // Form is valid, perform your login logic
                      _loginCubit.login(emailCon.text, passwordCon.text);
                     
                    }
                
              
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  login,
                  style: TextStyle(fontSize: 18, color: whiteColor),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  alreadyHaveAccount,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: darkFontGrey,
                  ),
                ),
                InkWell(
                  onTap: () => {Get.to(Register())},
                  child: Text(
                    reg,
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500, color: green),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    ));
  }
    Future<void> deleteSharedPreferencesKey(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Use the remove method to delete a specific key
    prefs.remove(key);

    print('Key $key deleted from SharedPreferences');
  }


}
