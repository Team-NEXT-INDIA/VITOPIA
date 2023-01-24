import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../screens/ShoppingPage/Data/product_data_class.dart';

class ApiService {
  final String _baseUrl = "http://10.0.2.2:5000";

  Future<List<Product>> getProducts() async {
    var response = await http.get(Uri.parse("$_baseUrl/products"));
    List<dynamic> jsonData = json.decode(response.body);
    List<Product> products = jsonData.map((product) {
      return Product.fromJson(product);
    }).toList();
    return products;
  }

  Future<Product> getProductById(int id) async {
    var response = await http.get(Uri.parse("$_baseUrl/products/$id"));
    var jsonData = json.decode(response.body);
    return Product.fromJson(jsonData);
  }

  Future<bool> deleteProduct(int id) async {
    var response = await http.delete(Uri.parse("$_baseUrl/products/$id"));
    return response.statusCode == 200;
  }
}