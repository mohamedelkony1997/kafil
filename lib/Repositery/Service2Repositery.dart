import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kafil/Models/ServicesModel2.dart';
import 'package:kafil/Models/servicesmodel.dart';
import 'package:kafil/consts/basUrl.dart';

class Product2Repository {
  Future<List<Product2>> fetchProducts2() async {
    final response =
        await http.get(Uri.parse('${BaseUrl}service/popular'), headers: {
      'Accept': 'application/json',
      'Accept-Language': 'ar',
    });

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      print(data);
      return data.map((json) => Product2.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
