import 'package:flutter/material.dart';
import 'package:flutter_shopping/constants/constant.dart';
import 'package:flutter_shopping/controllers/categories_controller.dart';
import 'package:get/get.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final categoriesController = Get.put(CategoriesController());

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: SizedBox(
        height: 25,
        child: Container(
          child: Obx(() {
            // print(categoriesController.categories);
            return categoriesController.loading == false
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoriesController.categories.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          // categoriesController.categories[index];
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                        child: Text(
                          categoriesController.categories[index],
                          style: TextStyle(
                              color: index == selectedIndex
                                  ? Colors.black
                                  : Colors.grey[500]),
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
        ),
      ),
    );
  }
}
