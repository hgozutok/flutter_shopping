import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_shopping/constants/constant.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Handbag", "Clothing", "Shoes", "Accessories"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                categories[index],
                style: TextStyle(
                    color: index == selectedIndex
                        ? Colors.black
                        : Colors.grey[500]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
