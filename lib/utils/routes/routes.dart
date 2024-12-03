
import 'package:fc_news/res/text_widget.dart';
import 'package:fc_news/view/auth/login_screen.dart';
import 'package:fc_news/view/auth/splash_screen.dart';
import 'package:flutter/material.dart';

import 'routes_name.dart';

class Routers {
  static WidgetBuilder generateRoute(String routeName) {
    switch (routeName) {
      case RoutesName.splashScreen:
        return (context) => const SplashScreen();
      case RoutesName.loginScreen:
        return (context) => const LoginScreen();
      default:
        return (context) => Scaffold(
          body: Center(
            child: textWidget(
                text: 'No Route Found!',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        );
    }
  }
}