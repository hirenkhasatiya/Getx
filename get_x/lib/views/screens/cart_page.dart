import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/Product_controller.dart';
import '../../Controller/cart_controller.dart';

class cartPage extends StatelessWidget {
  const cartPage({super.key});

  @override
  Widget build(BuildContext context) {
    productController controller = Get.find<productController>();
    cartController cart = Get.find<cartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: List.generate(
            cart.listcart.length,
            (index) => (cart.listcart.isNotEmpty)
                ? Obx(() {
                    return Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.all(5),
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            foregroundImage:
                                NetworkImage(cart.listcart[index].thumbnail),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(cart.listcart[index].title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Obx(() => Text(
                                    '\$${(cart.listcart[index].price * cart.listcart[index].Qty.value)}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  )),
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  cart.changeQty(index: index, changes: -1);
                                },
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                              Obx(() {
                                return Text(
                                  "${cart.listcart[index].Qty}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                );
                              }),
                              IconButton(
                                onPressed: () {
                                  cart.changeQty(index: index, changes: 1);
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  })
                : Container(),
          ),
        ),
      ),
    );
  }
}
