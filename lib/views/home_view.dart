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
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            Response response = snapshot.data;
            final dynamic data = response.data;
            List products = data['products'];
            return Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(productMap: products[index]);
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
