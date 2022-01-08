import 'package:flutter/material.dart';
import 'package:flutter_shopping/components/body.dart';
import 'package:flutter_shopping/constants/constant.dart';

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
        SizedBox(width: defaultPadding / 2),
      ],
    );
  }
}
