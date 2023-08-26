


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigatorController extends GetxController{

  static NavigatorController instance = Get.find();

  final  GlobalKey<NavigatorState> navigationKey = GlobalKey();

  navigateTo(String routeName){
    navigationKey.currentState!.pushNamed(routeName);
  }

  goBack()=> navigationKey.currentState!.pop();
}