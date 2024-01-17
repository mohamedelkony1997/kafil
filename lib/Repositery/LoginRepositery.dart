// api_repository.dart
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafil/Models/loginmodel.dart';
import 'package:kafil/Screens/Home/HomePage.dart';

import 'package:kafil/consts/basUrl.dart';
import 'package:kafil/consts/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiRepository {
  // Replace with your API base URL

  Future<void> loginUser(LoginRequest request) async {
    final response = await http.post(
      Uri.parse('${BaseUrl}user/login'),
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final token = json.decode(response.body)['access_token'];

      Get.to(
        HomePage(),
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('authToken', token);
    } else {
      Fluttertoast.showToast(
          msg: "${json.decode(response.body)['message']}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: green,
          textColor:whiteColor,
          fontSize: 16.0);
    }
  }
}
