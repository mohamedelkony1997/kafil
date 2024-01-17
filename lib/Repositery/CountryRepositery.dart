import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kafil/consts/basUrl.dart';

class CountryRepository {
  Future<Map<String, dynamic>> getCountries({int currentPage = 1}) async {
    final response = await http.get(
      Uri.parse('${BaseUrl}country?page=$currentPage'),
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'ar',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load countries');
    }
  }
}
