import 'package:get/get.dart';
import 'package:get_x/Modal/product_modal.dart';

class cartController extends GetxController {
  RxList<Product> listcart = <Product>[].obs;

  RxInt totalAmount = 0.obs;

  cartController() {
    getTotalAmount();
  }

  addcart({required Product product}) {
    listcart.add(product);
  }

  removecart({required Product product}) {
    listcart.remove(product);
  }

  changeQty({required int index, required int changes}) {
    listcart[index].Qty(listcart[index].Qty.value = changes);
    if (listcart[index].Qty.value <= 0) {
      listcart.removeAt(index);
    }
    getTotalAmount();
  }

  getTotalAmount() {
    listcart.forEach((element) {
      totalAmount(
          totalAmount.value = (element.price * element.Qty.value).toInt());
    });
  }
}
