import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/Controller/Product_controller.dart';
import 'package:get_x/Controller/cart_controller.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    productController controller = Get.find<productController>();


    var data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page : ${controller.getproduct[0].}"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(title: 'Demo data');
              },
              child: const Text('Alert Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar('success', 'hello');
              },
              child: const Text('Alert Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
