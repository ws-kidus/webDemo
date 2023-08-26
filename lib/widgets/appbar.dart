import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdemo/constants/constants.dart';
import 'package:webdemo/helpers/responsiveWidget.dart';

class AppAppBar {
  static AppBar topNavBar({
    required BuildContext context,
    required GlobalKey<ScaffoldState> key,
  }) {
    final isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    onSettingPressed() {}

    onNotificationPressed() {}

    return AppBar(
      iconTheme: const IconThemeData(color: AppColor.dark),
      backgroundColor: AppColor.light,
      elevation: 0,
      leading: isSmallScreen
          ? IconButton(
              onPressed: () => key.currentState!.openDrawer(),
              icon: const Icon(Icons.menu))
          : Row(
              children: [
                Image.asset(LocalImage.logo),
              ],
            ),
      title: Row(
        children: [
          Text(
            Constant.appName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Expanded(child: Container()),
          IconButton(
            onPressed: () => onNotificationPressed(),
            icon: const Icon(
              CupertinoIcons.settings,
              color: AppColor.dark,
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () => onNotificationPressed(),
                icon: const Icon(
                  CupertinoIcons.bell,
                  color: AppColor.dark,
                ),
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                      color: AppColor.active,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColor.lightGrey, width: 2)),
                ),
              )
            ],
          ),
          Container(width: 1, height: 22, color: AppColor.lightGrey),
          if(!isSmallScreen)const SizedBox(width: 10),
          if(!isSmallScreen)Text(
            "Kidus Gebremichael",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(width: 8),
          const CircleAvatar(
            radius: 22,
            backgroundColor: AppColor.lightGrey,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColor.light,
              child: Icon(
                CupertinoIcons.person,
                color: AppColor.dark,
              ),
            ),
          )
        ],
      ),
    );
  }
}
