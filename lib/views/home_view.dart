import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.blue));
  }
}

getProducts() async {
  final Dio dio = Dio();
  final Response response = await dio.get('https://dummyjson.com/products/1');
  log("The response data is ${response.data}");
}
