import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/Controller/Product_controller.dart';
import 'package:get_x/Controller/cart_controller.dart';
import 'package:get_x/views/screens/cart_page.dart';
import 'package:get_x/views/screens/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    productController controller = Get.put(productController());
    cartController cart = Get.put(cartController());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          centerTitle: true,
          actions: [
            Stack(
              children: [
                Positioned(
                    left: 20,
                    child: Obx(() {
                      return Text('${cart.listcart.length}');
                    })),
                IconButton(
                  onPressed: () {
                    Get.to(cartPage());
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
              ],
            ),
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
            Obx(() {
              return SliverGrid.builder(
                  itemCount: (controller.selectedCategory == 'All')
                      ? controller.getproduct.length
                      : controller.getcategorys.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.to(
                            const DetailPage(),
                            arguments: (controller.selectedCategory == 'All')
                                ? controller.getproduct[index]
                                : controller.getcategorys[index],
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(blurRadius: 2, color: Colors.grey)
                          ], borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          (controller.selectedCategory == 'All')
                                              ? controller
                                                  .getproduct[index].thumbnail
                                              : '',
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: const BorderRadius.vertical(
                                        bottom: Radius.circular(10))),
                                child: Stack(
                                  children: [
                                    Text(controller.getproduct[index].title,
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.bold)),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        '\$${controller.getproduct[index].price}',
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment(1.2, 3.2),
                                      child: IconButton(onPressed: () {
                                        Get.snackbar(
                                            'success',
                                            (cart.listcart.contains(controller
                                                    .getproduct[index])
                                                ? 'remove'
                                                : 'Add'));
                                        (cart.listcart.contains(
                                                controller.getproduct[index])
                                            ? cart.removecart(
                                                product: controller
                                                    .getproduct[index])
                                            : cart.addcart(
                                                product: controller
                                                    .getproduct[index]));
                                      }, icon: Obx(() {
                                        return Icon((cart.listcart.contains(
                                                controller.getproduct[index])
                                            ? CupertinoIcons.cart_badge_minus
                                            : CupertinoIcons.cart_badge_plus));
                                      })),
                                    )
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3 / 4.5, crossAxisCount: 2));
            }),
          ],
        ));
  }
}
