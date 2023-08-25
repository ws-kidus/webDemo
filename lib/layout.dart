import 'package:flutter/material.dart';
import 'package:webdemo/helpers/responsiveWidget.dart';
import 'package:webdemo/widgets/largeScreen.dart';
import 'package:webdemo/widgets/smallScreen.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: const ResponsiveWidget(
          largeScreen: LargeScreen(),
          smallScreen: SmallScreen(),
        ));
  }
}
