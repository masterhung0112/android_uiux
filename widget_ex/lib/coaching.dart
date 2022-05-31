import 'package:flutter/material.dart';
import 'custom_color_scheme.dart';
import 'SecondScreen.dart';
import 'custom_app_theme.dart';

class CoachingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isLight = Theme.of(context).brightness == Brightness.light;
    return Theme(
      data: isLight ? ThemeData(
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
      ]) : ThemeData.dark()
          .copyWith(extensions: <ThemeExtension<dynamic>>[CustomColors.dark]),
      child: Builder(builder: (BuildContext context) {
        return const DefaultTabController(length: 3, child: MyHomePage());
      }),
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
            Tab(
                child: Text('\u{f0c9}',
                    style: TextStyle(
                        fontFamily: 'Fa', fontWeight: FontWeight.w900))),
            Tab(icon: Icon(Icons.directions_bike)),
          ])),
      body: TabBarView(
        children: [
          Coaching(),
          // Icon('\u{f142}', style: TextStyle(fontFamily: 'Font Awesome')),
          Icon(IconData(0xf0c9, fontFamily: 'Fa')),
          // Icon(IconData(0xeea3, fontFamily: 'My Custom Font')),
          Icon(Icons.directions_bike),
        ],
      ),
    );
  }
}

class Coaching extends StatefulWidget {
  const Coaching({Key? key}) : super(key: key);

  @override
  State<Coaching> createState() => _CoachingState();
}

class _CoachingState extends State<Coaching> {
  final statuses = ['Available', 'Away'];

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return ListView(shrinkWrap: true, children: <Widget>[
      Column(children: <Widget>[
        Container(
            alignment: const Alignment(0.0, -0.4),
            height: 100.0,
            child:
                const Text('Get coaching', style: TextStyle(fontSize: 20.0))),
        Container(
            margin: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: const [
                  BoxShadow(blurRadius: 2.0, color: Colors.grey)
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                      padding: const EdgeInsets.fromLTRB(25.0, 25.0, 5.0, 5.0),
                      child: const Text('YOU HAVE',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 25.0),
                      child: const Text('244',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 40.0))),
                ]),
                // const SizedBox(width: 100.0),
                Container(
                    height: 50.0,
                    width: 125.0,
                    decoration: BoxDecoration(
                      color: customColors.success,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: const EdgeInsets.only(right: 20),
                    child: Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, SecondScreen.routeName,
                                  arguments: SecondScreenArguments(
                                      'Extract Argument screen',
                                      'Hello world'));
                            },
                            child: Text('Buy more',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))))),
              ],
            )),
        const SizedBox(height: 40.0),
        Container(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text('MY COACHES',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0)),
                  Row(
                    children: const <Widget>[
                      Text('VIEW PASS SESSIONS',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0)),
                      IconForCustomAppTheme()
                    ],
                  ),
                ])),
        const SizedBox(height: 10.0),
        GridView.count(
            crossAxisCount: 2,
            primary: false,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 4.0,
            shrinkWrap: true,
            children: List.generate(6,
                (index) => _buildCard('Tom', statuses[index % 2], index + 1)))
      ])
    ]);
  }

  Widget _buildCard(String name, String status, int cardIndex) {
    return Card(
        elevation: 7.0,
        margin: cardIndex.isEven
            ? const EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0)
            : const EdgeInsets.fromLTRB(25.0, 0.0, 10.0, 10.0),
        child: Column(children: <Widget>[
          const SizedBox(height: 12.0),
          Stack(children: <Widget>[
            Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.green,
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg')))),
            Container(
                margin: const EdgeInsets.only(left: 40.0),
                height: 20.0,
                width: 20.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: status == 'Away' ? Colors.amber : Colors.green,
                    border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 2.0)))
          ]),
          const SizedBox(height: 8.0),
          Text(name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: Colors.grey)),
          const SizedBox(height: 5.0),
          Text(
            status,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: Colors.grey),
          ),
          const SizedBox(height: 15.0),
          Expanded(
              child: Container(
                  width: 175.0,
                  decoration: BoxDecoration(
                      color: status == 'Away'
                          ? Colors.grey
                          : Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  child: const Center(
                      child: Text('Request',
                          style: TextStyle(color: Colors.white)))))
        ]));
  }
}
