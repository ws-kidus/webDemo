import 'package:flutter/cupertino.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 420;
const int customScreenSize = 1100;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;
  final Widget? customScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
    this.customScreen,
  }) : super(key: key);

  static bool isLargeScreen(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return deviceSize.width >= largeScreenSize;
  }

  static bool isMediumScreen(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return deviceSize.width < largeScreenSize &&
        deviceSize.width >= mediumScreenSize;
  }

  static bool isSmallScreen(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return deviceSize.width < mediumScreenSize;
  }

  static bool isCustomSize(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return deviceSize.width <= customScreenSize &&
        deviceSize.width >= mediumScreenSize;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      final width = constraint.maxWidth;

      if (width >= largeScreenSize) {
        return largeScreen;
      } else if (width < largeScreenSize && width >= mediumScreenSize) {
        return mediumScreen ?? largeScreen;
      } else if (width <= customScreenSize && width >= mediumScreenSize) {
        return customScreen ?? largeScreen;
      } else {
        return smallScreen ?? largeScreen;
      }
    });
  }
}
