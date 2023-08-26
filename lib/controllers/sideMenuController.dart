import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webdemo/constants/constants.dart';
import 'package:webdemo/routing/routing.dart';

class SideMenuController extends GetxController {
  static SideMenuController instance = Get.find();

  var activeItem = Routings.overViewPageRoute.obs;
  var hoverItem = "".obs;

  changeActiveItem(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

//  <editor-fold desc = "Menu Items">

  Widget returnIconFor(String itemName){
    switch(itemName){
      case Routings.overViewPageRoute:
        return _customIcon(iconData: Icons.auto_graph, itemName: itemName);
      case Routings.driversPageRoute:
      return _customIcon(iconData: Icons.drive_eta, itemName: itemName);
      case Routings.clientsPageRoute:
      return _customIcon(iconData: CupertinoIcons.person, itemName: itemName);
      case Routings.authenticationPageRoute:
      return _customIcon(iconData: Icons.power_settings_new, itemName: itemName);
      default:
        return _customIcon(iconData: Icons.power_settings_new, itemName: itemName);
    }
  }

  Widget _customIcon({required IconData iconData, required String itemName}) {
    if (isActive(itemName)) {
      return Icon(
        iconData,
        color: AppColor.dark,
        size: 24,
      );
    }
    return Icon(
      iconData,
      color: isHovering(itemName) ? AppColor.dark : AppColor.lightGrey,
      size: 22,
    );
  }
// </editor-fold>
}
