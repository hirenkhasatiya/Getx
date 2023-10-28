import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/Controller/Product_controller.dart';
import 'package:get_x/Controller/cart_controller.dart';
import 'package:get_x/Modal/product_modal.dart';

import 'cart_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    productController controller = Get.find<productController>();
    cartController cart = Get.find<cartController>();

    var data = Get.arguments as Product;

    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

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
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const cartPage());
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CarouselSlider.builder(
                itemCount: data.images.length,
                options: CarouselOptions(
                    autoPlay: true,
                    pageSnapping: true,
                    enableInfiniteScroll: true,
                    animateToClosest: true,
                    enlargeCenterPage: true),
                itemBuilder: (BuildContext context, index, realIndex) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                          image: NetworkImage(
                            data.images[index],
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6,
                            spreadRadius: 3,
                            offset: Offset(3, 2)),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: h * 0.62,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey,
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Align(
                          child: Text(
                            data.title,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      data.description,
                      style: const TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "\$ ${data.price}",
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Expanded(
              child: GestureDetector(
                onTap: () {
                  if (!cart.listcart.contains(data)) {
                    cart.addcart(product: data);
                  }
                  ;
                },
                child: Container(
                  color: Colors.grey,
                  height: h * 0.1,
                  child: const Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      "Add To Cart",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
