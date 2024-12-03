// ignore_for_file: unused_import, duplicate_ignore

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:market_shop/cartScreen.dart';
import 'package:market_shop/homeScreen.dart';
import 'package:market_shop/productScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
