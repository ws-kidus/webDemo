

import 'package:flutter/material.dart';
import 'package:webdemo/constants/controllers.dart';
import 'package:webdemo/routing/router.dart';
import 'package:webdemo/routing/routing.dart';

Navigator localNavigator = Navigator(
  key: navigatorController.navigationKey,
  initialRoute: Routings.overViewPageRoute,
  onGenerateRoute: (settings)=> AppRouter.generateRoute(settings),
);