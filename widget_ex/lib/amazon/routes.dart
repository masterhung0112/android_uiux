import 'package:flutter/material.dart';
import 'package:widget_ex/amazon/features/root/screens/Root.dart';
import './features/auth/screens/auth_screen.dart';

const amazonDefaultRoute = '/amazon';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case amazonDefaultRoute:
      return  MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Root(),
      );
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AuthScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen doess not exist'),
          ),
        ),
      );
  }
}
