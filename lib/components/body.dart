import 'package:flutter/material.dart';
import 'package:flutter_shopping/components/categories.dart';
import 'package:flutter_shopping/constants/constant.dart';
import 'package:flutter_shopping/models/product.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Column(
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
              child: Image.network(
                  "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"),
            ),
            Text("Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops"),
          ],
        )
      ],
    );
  }
}
