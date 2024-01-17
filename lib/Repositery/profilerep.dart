import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kafil/Models/profile.dart';
import 'package:kafil/consts/basUrl.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? Authtoken;

class UserRepositorydetails {
  Future<UserData> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Authtoken = prefs.getString("authToken");
    final response = await http.get(
      Uri.parse('${BaseUrl}user/who-am-i'),
      headers: {
        'Authorization': '$Authtoken',
        'Accept': 'application/json',
        'Accept-Language': 'ar',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return UserData.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load user details');
    }
  }
}
