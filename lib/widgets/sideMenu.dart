import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webdemo/constants/constants.dart';
import 'package:webdemo/constants/controllers.dart';
import 'package:webdemo/helpers/responsiveWidget.dart';
import 'package:webdemo/routing/routing.dart';
import 'package:webdemo/widgets/sideMenuItem.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  _onTap(BuildContext context, String itemName) {
    if (itemName == Routings.authenticationPageRoute) {
      return;
    }

    if (!menuController.isActive(itemName)) {
      menuController.changeActiveItem(itemName);
      if (ResponsiveWidget.isSmallScreen(context)) {
        Get.back();
      }
      navigatorController.navigateTo(itemName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      color: AppColor.light,
      child: SafeArea(
        child: ListView(
          children: [
            if (ResponsiveWidget.isSmallScreen(context))
              Row(
                children: [
                  Image.asset(
                    LocalImage.logo,
                    width: 50,
                  ),
                  Text(
                    Constant.appName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            if (ResponsiveWidget.isSmallScreen(context))
              Divider(color: AppColor.lightGrey.withOpacity(0.5)),
            SizedBox(height: deviceSize.height / 30),
            Column(
              children: Routings.sideMenuItems
                  .map(
                    (itemName) => SideMenuItem(
                      onTap: () => _onTap(context, itemName),
                      itemName: itemName == Routings.authenticationPageRoute
                          ? "Log out"
                          : itemName,
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
