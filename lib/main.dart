import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webdemo/constants/theme.dart';
import 'package:webdemo/controllers/NavigatorController.dart';
import 'package:webdemo/controllers/sideMenuController.dart';
import 'package:webdemo/layout.dart';

void main() {
  Get.put(SideMenuController());
  Get.put(NavigatorController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.whiteTheme,
      home: const Layout(),
    );
  }
}


