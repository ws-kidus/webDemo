import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webdemo/constants/constants.dart';
import 'package:webdemo/constants/controllers.dart';
import 'package:webdemo/helpers/responsiveWidget.dart';

class SideMenuItem extends StatelessWidget {
  final VoidCallback onTap;
  final String itemName;

  const SideMenuItem({
    Key? key,
    required this.onTap,
    required this.itemName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomSize(context)) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: _VerticalMenuItem(onTap: onTap, itemName: itemName),
      );
    }
    return _HorizontalMenuItem(onTap: onTap, itemName: itemName);
  }
}

class _VerticalMenuItem extends StatelessWidget {
  final VoidCallback onTap;
  final String itemName;

  const _VerticalMenuItem({
    Key? key,
    required this.onTap,
    required this.itemName,
  }) : super(key: key);

  Widget _text(BuildContext context) {
    if (menuController.isActive(itemName)) {
      return Text(
        itemName,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColor.dark,
              fontWeight: FontWeight.bold,
            ),
      );
    } else {
      return Text(
        itemName,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: menuController.isHovering(itemName)
                  ? AppColor.dark
                  : AppColor.lightGrey,
              fontWeight:
                  menuController.isHovering(itemName) ? FontWeight.bold : null,
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.hoverItem(itemName)
            : menuController.hoverItem('notHovering');
      },
      child: Obx(() => Container(
            color: menuController.isHovering(itemName)
                ? AppColor.lightGrey.withOpacity(0.1)
                : Colors.transparent,
            child: Row(
              children: [
                Visibility(
                  visible: menuController.isHovering(itemName) ||
                      menuController.isActive(itemName),
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Container(
                    width: 6,
                    height: 40,
                    color: AppColor.dark,
                  ),
                ),
                SizedBox(width: deviceSize.width / 80),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      menuController.returnIconFor(itemName),
                      const SizedBox(height: 10),
                      Flexible(child: _text(context))
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class _HorizontalMenuItem extends StatelessWidget {
  final VoidCallback onTap;
  final String itemName;

  const _HorizontalMenuItem({
    Key? key,
    required this.onTap,
    required this.itemName,
  }) : super(key: key);

  Widget _text(BuildContext context) {
    if (menuController.isActive(itemName)) {
      return Text(
        itemName,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColor.dark,
              fontWeight: FontWeight.bold,
            ),
      );
    } else {
      return Text(
        itemName,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: menuController.isHovering(itemName)
                  ? AppColor.dark
                  : AppColor.lightGrey,
              fontWeight:
                  menuController.isHovering(itemName) ? FontWeight.bold : null,
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.hoverItem(itemName)
            : menuController.hoverItem('notHovering');
      },
      child: Obx(() => Container(
            color: menuController.isHovering(itemName)
                ? AppColor.lightGrey.withOpacity(0.1)
                : Colors.transparent,
            child: Row(
              children: [
                Visibility(
                  visible: menuController.isHovering(itemName) ||
                      menuController.isActive(itemName),
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Container(
                    width: 6,
                    height: 40,
                    color: AppColor.dark,
                  ),
                ),
                SizedBox(width: deviceSize.width / 80),
                menuController.returnIconFor(itemName),
                const SizedBox(width: 30),
                _text(context),
              ],
            ),
          )),
    );
  }
}
