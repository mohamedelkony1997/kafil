import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kafil/Models/Usertype.dart';
import 'package:kafil/consts/basUrl.dart';

// api_repository.dart

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiRepository {
  Future<ApiResponse> fetchData() async {
    try {
      final response = await http.get(Uri.parse("${BaseUrl}dependencies"));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final apiResponse = ApiResponse.fromJson(data);
        return apiResponse;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception("Failed to make the request: $e");
    }
  }
}
