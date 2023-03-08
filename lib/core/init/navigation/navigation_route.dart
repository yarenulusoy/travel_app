import 'package:flutter/material.dart';
import '../../../not_found_widget.dart';
import '../../../view/home_view.dart';
import '../../constant/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  // ignore: sort_constructors_first
  NavigationRoute._init();

  Route<dynamic> onGenerateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.HOME_VIEW:
        //return normalNavigate(HomeView());
      default:
        return normalNavigate( NotFoundWidget());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
