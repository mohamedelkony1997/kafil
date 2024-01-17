import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kafil/Models/servicesmodel.dart';
import 'package:kafil/consts/basUrl.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('${BaseUrl}service'), headers: {
      'Accept': 'application/json',
      'Accept-Language': 'ar',
    });

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      print(data);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
