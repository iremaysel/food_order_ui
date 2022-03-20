import 'package:flutter/material.dart';
import 'package:food_order_ui/view/splash_screen.dart';
import 'package:food_order_ui/view/start_page/start_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: StartPageView(),
    );
  }
}