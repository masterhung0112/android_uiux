import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:widget_ex/SecondScreen.dart';
import 'package:widget_ex/amazon/amazon_home.dart';
import 'package:widget_ex/coaching.dart';
import 'package:widget_ex/constants/routes.dart';

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
        routeHome: (context) => AmazonHome(),
        routeCoachingTab: (context) => CoachingTab(),
        SecondScreen.routeName: (context) => const SecondScreen(),
      },
    );
  }
}

