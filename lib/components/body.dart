import 'package:flutter/material.dart';
import 'package:flutter_shopping/components/categories.dart';
import 'package:flutter_shopping/constants/constant.dart';
import 'package:flutter_shopping/controllers/product_controller.dart';
import 'package:flutter_shopping/screens/product_screen.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    // print(productsController.products![9].title);
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "Hugo's Shop",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Categories(),
          ProductList(),
        ],
      ),
    );
  }

  Obx ProductList() {
    return Obx(() {
      return productsController.loading == false
          ? Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: productsController.products.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: productsController.products[index],
                  );
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            );
    });
  }

  Widget ProductItem({product}) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductScreen(product: product));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 30,
                  color: Colors.blue.withOpacity(0.23),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 3),
              child: Image.network(product.image),
            ),
          ),
          Text(
            product.title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
          Center(
            child: Text(
              "\$${product.price}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
