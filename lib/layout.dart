import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdemo/helpers/responsiveWidget.dart';
import 'package:webdemo/widgets/largeScreen.dart';
import 'package:webdemo/widgets/sideMenu.dart';
import 'package:webdemo/widgets/smallScreen.dart';
import 'package:webdemo/widgets/appbar.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
        key: scaffoldKey,
        drawer: const Drawer(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            child: SideMenu()),
        appBar: AppAppBar.topNavBar(context: context, key: scaffoldKey),
        body: const ResponsiveWidget(
          largeScreen: LargeScreen(),
          smallScreen: SmallScreen(),
        ));
  }
}
