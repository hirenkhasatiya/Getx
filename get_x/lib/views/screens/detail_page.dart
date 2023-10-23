import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var a = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page : ${a}"),
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
