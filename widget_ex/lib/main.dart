import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:widget_ex/SecondScreen.dart';
import 'package:widget_ex/coaching.dart';
import 'package:widget_ex/constants/routes.dart';
import 'package:widget_ex/custom_app_theme.dart';
import "dart:math";

import 'custom_color_scheme.dart';
import 'my_flutter_app_icons.dart';

void main() {
  runApp(const MyApp());
}

void showLayoutGuidelines() {
  debugPaintSizeEnabled = true;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        routeHome: (context) => CoachingTab(),
        routeCoachingTab: (context) => CoachingTab(),
        SecondScreen.routeName: (context) => const SecondScreen(),
      },
    );
  }
}

