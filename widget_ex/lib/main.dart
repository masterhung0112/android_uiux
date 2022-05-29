import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:widget_ex/SecondScreen.dart';
import 'package:widget_ex/coaching.dart';
import 'package:widget_ex/custom_app_theme.dart';
import "dart:math";

import 'custom_color_scheme.dart';

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
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          tabBarTheme: const TabBarTheme(
            labelColor: Colors.black,
          )).copyWith(extensions: <ThemeExtension<dynamic>>[
        CustomColors.light,
      ]),
      darkTheme: ThemeData.dark()
          .copyWith(extensions: <ThemeExtension<dynamic>>[CustomColors.dark]),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const DefaultTabController(length: 3, child: MyHomePage()),
        SecondScreen.routeName: (context) => const SecondScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
      )),
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const FlutterLogo(size: 25.0),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.white,
          // leading: IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Icons.arrow_back),
          //     color: Colors.grey),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              color: Colors.grey),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ])),
      body: TabBarView(
        children: [
          Coaching(),
          Icon(Icons.directions_transit),
          Icon(Icons.directions_bike),
        ],
      ),
    );
  }
}
