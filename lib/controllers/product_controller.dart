import 'package:flutter/material.dart';
import 'package:flutter_shopping/models/product.dart';
import 'package:flutter_shopping/services/remote_services.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductsController extends GetxController {
  List<dynamic> products = [].obs;

  late Future<String> pname;
  ScrollController controller = ScrollController();
  late var _loading = false.obs;

  final int _perPage = 10;
  late int _xPage = 1;
  get loading => _loading.value;
  String? category;
  // final int _page = 1;
  // int get page {
  //   return _page;
  // }

  // set page(int value) {
  //   page = value;
  // }

  @override
  void onInit() {
    controller.addListener((pagination));
    productList();
    // _loadData(_xPage, _perPage, category);

    super.onInit();
  }

  @override
  void onDispose() {
    controller.dispose();
  }

  void pagination() {
    if ((controller.position.pixels == controller.position.maxScrollExtent)) {
      _loading.value = true;
      NextPage();
      //  print(controller.position.pixels.toString());
      //add api for load the more data according to new page

    } else if ((controller.position.pixels ==
        controller.position.minScrollExtent)) {
      _loading.value = true;
      PreviousPage();
      //  print(controller.position.pixels.toString());
      //add api for load the more data according to new page

    }
  }

  NextPage() async {
    _xPage++;
    // print(_xPage);
    await _loadData(_xPage, _perPage, category);
    //print(_xPage);
  }

  Future<void> PreviousPage() async {
    _xPage--;
    // print(_xPage);
    if (_xPage <= 0) _xPage = 1;
    // productList(_xPage, _perPage);
    await _loadData(_xPage, _perPage, category);
    //  print(_xPage);
  }

  Future<void> LoadPage(String? categoryid) async {
    category = categoryid;
    if (_xPage <= 0) _xPage = 1;
    await _loadData(_xPage, _perPage, category);
  }

  _loadData(int page, int perPage, String? category) async {
    _loading.value = true;
    try {
      var prod = await productList();
      //  .then((value) => products = value);
      products = prod.toList();
      _loading.value = false;
      update();

      //  }
      //});
    } catch (e) {
      print("Error:");
      print(e);
      _loading.value = false;
    } finally {
      _loading.value = false;
    }
  }

  Future<List<Product>> productList(
      // int ppage, int perPage, String? category
      ) async {
    _loading.value = true;
    var productsList = await RemoteService.getProducts();
    //  print(productsList![0].title);
    if (productsList != null) {
      products = productsList;
    }

    //print(products![0].title);

    _loading.value = false;

    return productsList!;
  }

  // Future<Product> productById(int id) async {

  //   //Map<dynamic, int> map = {"page": 10, "perPage": 10};

  //  // return await wo.getProductById(id: id);
  // }
}
