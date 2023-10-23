import 'package:flutter/material.dart';
import 'package:get_x/Modal/product_modal.dart';
import 'package:http/http.dart ' as http;

import 'dart:convert';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String api = "https://dummyjson.com/products";

  getProduct() async {
    http.Response response = await http.get(Uri.parse("$api"));

    List allProduct = [];

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List alldata = data['products'];

      allProduct = alldata
          .map(
            (e) => Product.fromJson(data: e),
          )
          .toList();
      return allProduct;
    }
  }
}
