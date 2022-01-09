import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/models/login_model.dart';
import 'package:flutter_shopping/screens/home/home_screen.dart';
import 'package:flutter_shopping/services/auth_service.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService authService = Get.put(AuthService());
  late String username = "mor_2314";
  late String password = "83r5^_";
  final usernameController = TextEditingController(text: "mor_2314");
  final passwordController = TextEditingController(text: "83r5^_");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Username",
          ),
          TextField(
            controller: usernameController,
            onChanged: (value) {
              username = value;
            },
            decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Password",
          ),
          TextField(
            controller: passwordController,
            onChanged: (value) {
              password = value;
            },
            decoration: InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              LoginModel model = LoginModel(
                  username: usernameController.text,
                  password: passwordController.text);
              var result = await authService.loginUser(model);
              print(authService.token);
              //  result.then((value) => print("res" + value));
              if (authService.token != null) {
                Get.snackbar(
                  "Login",
                  "logged in successfully",
                  duration: Duration(seconds: 3),
                );
                Get.to(HomeScreen());
              } else {
                Get.snackbar(
                  "Login",
                  "Invalid login credentials",
                  duration: Duration(seconds: 3),
                );
              }
            },
            child: Text("Login"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text("Register"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.to(HomeScreen());
            },
            child: Text("Go Home"),
          ),
        ],
      ),
    ));
  }
}
