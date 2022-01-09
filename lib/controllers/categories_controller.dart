import 'package:flutter/material.dart';
import 'package:flutter_shopping/models/category.dart';
import 'package:flutter_shopping/services/remote_services.dart';

import 'package:get/get.dart';

class CategoriesController extends GetxController {
  List<dynamic> categories = [].obs;
  //List<String> categories = ["test", "testq"].obs as List<String>;
  ScrollController controller = ScrollController();
  late var _loading = false.obs;

  final int _perPage = 10;
  late int _xPage = 1;
  get loading => _loading.value;

  @override
  void onInit() {
    controller.addListener((pagination));
    getCategories();
    //_loadCategories(_xPage, _perPage);
    super.onInit();
  }

  @override
  void onDispose() {
    controller.dispose();
  }

  void pagination() {
    if ((controller.position.pixels == controller.position.maxScrollExtent)) {
      _loading.value = true;
      debugPrint("pagcont++");
      NextPage();
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

    await _loadCategories(_xPage, _perPage);
  }

  Future<void> PreviousPage() async {
    _xPage--;

    if (_xPage <= 0) _xPage = 1;

    await _loadCategories(_xPage, _perPage);
  }

  Future<List<dynamic>> getCategories() async {
    _loading.value = true;
    var cats = await RemoteService.getCategories();

    if (cats != null) {
      categories = cats;
    }

    _loading.value = false;
    return categories;
  }

  _loadCategories(int page, int perPage) async {
    _loading.value = true;
    try {
      // var data = await getCategories(page, perPage);
      //if (data == null) {
      _xPage--;
      //  await getCategories(_xPage, perPage);
      // }
      _loading.value = false;
      update();
    } catch (e) {
      print("Error:");
      print(e);
      _loading.value = false;
    } finally {
      _loading.value = false;
    }
  }
}
