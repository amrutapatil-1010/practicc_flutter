import 'package:flutter/material.dart';
import 'package:flutter_task/name_search_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: NameScreen(),
    );
  }
}
