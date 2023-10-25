import 'package:counter_app/Controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    counterController controller = Get.put(counterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
        centerTitle: true,
      ),
      body: Obx(() => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Spacer(
                  flex: 5,
                ),
                Center(
                    child: Text(
                  "${controller.counter}",
                  style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                )),
                const Spacer(
                  flex: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.increase();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        height: 90,
                        width: 170,
                        child: const Center(
                            child: Text("+2",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white))),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.increase2();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        height: 90,
                        width: 170,
                        child: const Center(
                            child: Text("+4",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white))),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.Decrement();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        height: 90,
                        width: 170,
                        child: const Center(
                            child: Text("-2",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white))),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.Decrement2();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        height: 90,
                        width: 170,
                        child: const Center(
                            child: Text("-4",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white))),
                      ),
                    ),
                  ],
                ),
                const Spacer()
              ],
            ),
          )),
    );
  }
}
