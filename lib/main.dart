import 'package:flutter/material.dart';
import 'package:flutter_shopping/constants/constant.dart';
import 'package:flutter_shopping/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: textColor,
              displayColor: Colors.grey[600],
            ),
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
