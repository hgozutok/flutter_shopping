import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/components/product_body.dart';
import 'package:flutter_shopping/models/product.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color pagecolor = CreateRandomColor();
    return Scaffold(
      backgroundColor: pagecolor,
      appBar: AppBar(
        backgroundColor: pagecolor,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: ProductBody(
        product: product,
      ),
    );
  }
}

CreateRandomColor() {
  return Color.fromARGB(
      255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
}
