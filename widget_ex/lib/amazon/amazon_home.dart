import 'package:flutter/material.dart';
import 'package:widget_ex/amazon/routes.dart';

class AmazonHome extends StatefulWidget {
  @override
  State<AmazonHome> createState() => _AmazonHomeState();
}

class _AmazonHomeState extends State<AmazonHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        initialRoute: amazonDefaultRoute,
        onGenerateRoute: (settings) => generateRoute(settings),
      ),
    );
  }
}
