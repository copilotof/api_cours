import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Response response;
  @override
  void initState() {
    assignProductsResponse();
    super.initState();
  }

  assignProductsResponse() async {
    response = await getProductsResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.blue));
  }
}

Future<Response> getProductsResponse() async {
  final Dio dio = Dio();
  final Response response = await dio.get('https://dummyjson.com/products/1');
  return response;
  // log("The response data is ${response.data}");
}
