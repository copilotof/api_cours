import 'package:api_cours/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.Response
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeView());
  }
}
