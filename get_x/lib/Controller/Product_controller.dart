import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_x/Modal/product_modal.dart';
import 'package:get_x/helpers/apihelper.dart';

class productController extends GetxController {
  RxString selectedCategory = 'All'.obs;

  RxInt selectindex = 0.obs;

  RxList<Product> allProduct = <Product>[].obs;
  RxList<String> _allcategorys = <String>[].obs;

  RxList allproductCategory = [].obs;

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
    allProduct(await ApiHelper.apiHelper.getProduct());
    _allcategorys(
        (allProduct.map((e) => e.category).toList()).toSet().toList());
    print("data gated");
    _allcategorys.insert(0, 'All');
    update();
  }

  productController() {
    init();
  }

  getproducts({required String category}) {
    (selectedCategory == getcategorys['category'])
        ? allproductCategory = getcategorys
        : Container();
    update();
  }

  changeindex({required int index}) {
    selectindex(index);
    update();
  }

  selectcategory({required String category}) {
    selectedCategory(category);
    update();
  }

  get getcategorys {
    return _allcategorys.value;
  }
}
