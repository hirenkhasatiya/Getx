import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_x/Modal/product_modal.dart';
import 'package:get_x/helpers/apihelper.dart';

class productController extends GetxController {
  RxString selectedCategory = 'All'.obs;

  RxInt selectindex = 0.obs;

  RxList<Product> _allProduct = <Product>[].obs;
  RxList<String> _allcategorys = <String>[].obs;

  List image = [
    'Assets/images/image1.jpg',
    'Assets/images/image2.jpg',
    'Assets/images/image7.jpeg',
    'Assets/images/image4.jpg',
    'Assets/images/image6.jpg',
    'Assets/images/image5.png',
    'Assets/images/image6.jpg',
    'Assets/images/image8.jpeg',
  ];
  init() async {
    print("method called");
    _allProduct(await ApiHelper.apiHelper.getProduct());
    _allcategorys(
        (_allProduct.map((e) => e.category).toList()).toSet().toList());
    print("data gated");
    _allcategorys.insert(0, 'All');
    update();
  }

  productController() {
    init();
  }

  changeindex({required int index}) {
    selectindex(index);
    update();
  }

  selectcategory({required String category}) {
    selectedCategory(category);
    update();
  }

  RxList<Product> get getproduct {
    return _allProduct;
  }

  RxList<String> get getcategorys {
    return _allcategorys;
  }
}
