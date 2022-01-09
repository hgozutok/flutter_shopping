import 'package:flutter/material.dart';
import 'package:flutter_shopping/components/body.dart';
import 'package:flutter_shopping/constants/constant.dart';
import 'package:flutter_shopping/screens/home/login_screen.dart';
import 'package:flutter_shopping/screens/profile.dart';
import 'package:flutter_shopping/services/auth_service.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    AuthService authService = Get.put(AuthService());
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.greenAccent,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.greenAccent,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.shopping_bag,
            color: Colors.greenAccent,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.person,
            color: Colors.greenAccent,
          ),
          onPressed: () {
            print(authService.token);
            authService.token != null
                ? Get.to(ProfileScreen())
                : Get.to(LoginScreen());
            //  Get.to(LoginScreen());
          },
        ),
        SizedBox(width: defaultPadding / 2),
      ],
    );
  }
}
