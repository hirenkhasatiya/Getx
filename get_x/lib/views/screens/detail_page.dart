import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/Controller/Product_controller.dart';
import 'package:get_x/Controller/cart_controller.dart';
import 'package:get_x/Modal/product_modal.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    productController controller = Get.find<productController>();

    var data = Get.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
      ),
      body: Center(),
    );
  }
}
