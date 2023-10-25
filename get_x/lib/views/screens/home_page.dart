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
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.shopping_cart_rounded))
          ],
        ),
        drawer: const Drawer(),
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              CarouselSlider.builder(
                itemCount: controller.image.length,
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      controller.changeindex(index: index);
                    },
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
              const SizedBox(height: 10),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.image.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: controller.selectindex == index
                              ? Colors.primaries[index % 18]
                              : Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      height: 10,
                      width: controller.selectindex == index ? 30 : 10,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => (controller.getproduct.isNotEmpty)
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
                                      category: controller.getcategorys[index],
                                    );
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 900),
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            width:
                                                controller.selectedCategory ==
                                                        controller
                                                            .getcategorys[index]
                                                    ? 1
                                                    : 0),
                                        color: controller.selectedCategory ==
                                                controller.getcategorys[index]
                                            ? Colors.grey.shade700
                                            : Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      controller.getcategorys[index],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: controller.selectedCategory ==
                                                controller.getcategorys[index]
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ])),
            SliverGrid.builder(
                itemCount: (controller.selectedCategory == 'All')
                    ? controller.getproduct.length
                    : controller.getcategorys.length,
                itemBuilder: (context, index) => Container(
                      child: Text('${index}'),
                    ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2)),
          ],
        ));
  }
}
