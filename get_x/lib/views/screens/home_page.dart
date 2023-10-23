import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/Controller/Product_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    productController controller = Get.put(productController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: controller.image.length,
            options: CarouselOptions(
                initialPage: 1,
                autoPlay: true,
                pageSnapping: true,
                enableInfiniteScroll: true,
                animateToClosest: true,
                enlargeCenterPage: true),
            itemBuilder: (BuildContext context, index, realIndex) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.primaries[index],
                    image: DecorationImage(
                        image: AssetImage(
                          controller.image[index],
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6,
                          spreadRadius: 3,
                          offset: Offset(3, 2)),
                    ]),
              );
            },
          ),
          SizedBox(height: 20),
          GetBuilder<productController>(
            builder: (controller) => (controller.getproduct.isNotEmpty)
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          children: List.generate(
                              controller.getcategorys.length,
                              (index) => GestureDetector(
                                    onTap: () {
                                      controller.selectcategory(
                                          category:
                                              controller.getcategorys[index]);
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 600),
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              style: BorderStyle.solid,
                                              width: controller
                                                          .selectedCategory ==
                                                      controller
                                                          .getcategorys[index]
                                                  ? 1
                                                  : 0),
                                          color: controller.selectedCategory ==
                                                  controller.getcategorys[index]
                                              ? Colors.grey
                                              : Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                          controller.getcategorys[index],
                                          style: const TextStyle(fontSize: 16)),
                                    ),
                                  )),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
    );
  }
}
