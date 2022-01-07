import 'package:flutter_shopping/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteService {
  static const String url = 'https://fakestoreapi.com/products';

  static Future<List<Product>?> getProducts() async {
    try {
      var response = await http.get(Uri.parse(url));
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
}
