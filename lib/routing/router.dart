import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdemo/pages/clients/clients.dart';
import 'package:webdemo/pages/drivers/drivers.dart';
import 'package:webdemo/pages/overview/overview.dart';
import 'package:webdemo/routing/routing.dart';

class AppRouter {
  static generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routings.overViewPageRoute:
        return _getPageRoute(const OverviewPage());
      case Routings.driversPageRoute:
        return _getPageRoute(const DriversPage());
      case Routings.clientsPageRoute:
        return _getPageRoute(const ClientsPage());
      case Routings.authenticationPageRoute:
        return _getPageRoute(const OverviewPage());
      default:
        _getPageRoute(const OverviewPage());
    }
  }

  static _getPageRoute(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }
}
