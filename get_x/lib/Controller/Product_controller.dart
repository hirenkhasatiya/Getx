import 'package:get/get.dart';
import 'package:get_x/Modal/product_modal.dart';
import 'package:get_x/helpers/apihelper.dart';

class productController extends GetxController {
  String selectedCategory = 'All';

  List<Product> _allProduct = [];
  List<String> _allcategorys = [];

  List image = [
    'Assets/images/image1.jpg',
    'Assets/images/image2.jpg',
    'Assets/images/image4.jpg',
    'Assets/images/image5.png',
  ];

  init() async {
    print("method called");
    _allProduct = await ApiHelper.apiHelper.getProduct();
    _allcategorys =
        (_allProduct.map((e) => e.category).toList()).toSet().toList();
    print("data gated");
    _allcategorys.insert(0, 'All');
    update();
  }

  productController() {
    init();
  }

  selectcategory({required String category}) {
    selectedCategory = category;
    update();
  }

  get getproduct {
    return _allProduct;
  }

  get getcategorys {
    return _allcategorys;
  }
}
