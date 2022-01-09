import 'package:flutter_shopping/models/login_model.dart';
import 'package:flutter_shopping/screens/home/home_screen.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static const String baseUrl = 'https://fakestoreapi.com';
  static const String login = '/auth/login';

  String? token;
  Future<String?> loginUser(LoginModel model) async {
    var response = await http.post(
      Uri.parse(baseUrl + login),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(model.toJson()),
      //body: model,
    );

    print(response.body);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);
      if (responseData.containsKey('token')) {
        print("object");
        token = responseData['token'];
        return responseData['token'];
      } else {
        token = null;
        return null;
      }
      //  return response.body;
    } else {
      token = null;
      return null;
    }
  }

  bool logoutUser() {
    token = null;
    Get.to(HomeScreen());
    return true;
  }
}
