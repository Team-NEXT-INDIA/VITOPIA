import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../screens/ShoppingPage/Data/product_data_class.dart';

class ApiService {
  final String _baseUrl = "http://216.48.191.15:1080";
  // final String _baseUrl = "http://10.0.2.2:1080";

  Future<List<Product>> getProducts() async {
    var response = await http.get(Uri.parse("$_baseUrl/products"));
    List<dynamic> jsonData = json.decode(response.body);
    List<Product> products = jsonData.map((product) {
      return Product.fromJson(product);
    }).toList();
    return products;
  }

  Future<List<Product>> getTickets() async {
    var response = await http.get(Uri.parse("$_baseUrl/tickets"));
    List<dynamic> jsonData = json.decode(response.body);
    List<Product> products = jsonData.map((product) {
      return Product.fromJson(product);
    }).toList();
    return products;
  }
}
