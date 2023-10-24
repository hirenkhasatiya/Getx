import 'package:get/get_state_manager/get_state_manager.dart';

class counterController extends GetxController {
  int counter = 0;

  increase() {
    counter += 2;
    update();
  }

  increase2() {
    counter += 4;
    update();
  }

  Decrement() {
    counter -= 2;
    update();
  }

  Decrement2() {
    counter -= 4;
    update();
  }
}
