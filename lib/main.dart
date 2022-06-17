import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uv_tracker/home.dart';

void main() {
  runApp(UVTrackerApp());
}

class UVTrackerApp extends StatelessWidget {
  const UVTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
