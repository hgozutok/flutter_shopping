import 'package:flutter_shopping/models/category.dart';
import 'package:flutter_shopping/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteService {
  static const String baseUrl = 'https://fakestoreapi.com';
  static const String products = '/products';
  static const String categories = '/products/categories';

  static Future<List<Product>?> getProducts() async {
    try {
      var response = await http.get(Uri.parse(baseUrl + products));
      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        return body.map((dynamic item) => Product.fromJson(item)).toList();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<List<String>?> getCategories() async {
    try {
      var response = await http.get(Uri.parse(baseUrl + categories));

      List<String> att = [];
      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        att =
            body.toString().replaceAll(']', '').replaceAll("[", "").split(",");

        return att;

        // json.decoder.convert(response.body);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
