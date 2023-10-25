import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class counterController extends GetxController {
  RxInt counter = 0.obs;

  increase() {
    counter += 2;
  }

  increase2() {
    counter += 4;
  }

  Decrement() {
    counter -= 2;
  }

  Decrement2() {
    counter -= 4;
  }
}
