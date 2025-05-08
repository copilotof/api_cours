import 'dart:developer';

import 'package:api_cours/widgets/product_card.dart';
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
    return Scaffold(
      backgroundColor: Color(0xfff5f8ff),
      appBar: AppBar(backgroundColor: Colors.blue),
      body: FutureBuilder(
        future: getProductsResponse(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 280,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ProductCard();
                },
              ),
            );
          }
        },
      ),
    );
  }
}

Future<Response> getProductsResponse() async {
  final Dio dio = Dio();
  final Response response = await dio.get('https://dummyjson.com/products');
  return response;
  // log("The response data is ${response.data}");
}
