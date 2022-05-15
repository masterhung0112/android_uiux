import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    return const MaterialApp(home: MyHomePage());
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
        appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const FlutterLogo(size: 25.0),
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
                color: Colors.grey),
            actions: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                  color: Colors.grey)
            ]),
        body: ListView(shrinkWrap: true, children: <Widget>[
          Column(children: <Widget>[
            Container(
                alignment: const Alignment(0.0, -0.4),
                height: 100.0,
                child: const Text('Get coaching',
                    style: TextStyle(fontSize: 20.0))),
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
                  children: <Widget>[
                    Stack(children: <Widget>[
                      Container(
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 25.0, 5.0, 5.0),
                          child: const Text('YOU HAVE',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0))),
                      Container(
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 40.0, 5.0, 25.0),
                          child: const Text('244',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0))),
                    ]),
                    const SizedBox(width: 100.0),
                    Container(
                        height: 50.0,
                        width: 125.0,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent[100],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                            child: Text('Buy more',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)))),
                  ],
                )),
            const SizedBox(height: 40.0),
            Container(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text('MY COACHES',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0)),
                      Text('VIEW PASS SESSIONS',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0))
                    ])),
            const SizedBox(height: 10.0),
            GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 4.0,
                shrinkWrap: true,
                children: <Widget>[
                  _buildCard('Tom', 'Available', 1),
                  _buildCard('Tom', 'Away', 2),
                  _buildCard('Tom', 'Away', 3),
                  _buildCard('Tom', 'Available', 4),
                  _buildCard('Tom', 'Away', 5),
                  _buildCard('Tom', 'Available', 6),
                ])
          ]),
        ]));
  }

  Widget _buildCard(String name, String status, int cardIndex) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
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
                      color: status == 'Away' ? Colors.grey : Colors.green,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  child: const Center(
                      child: Text('Request',
                          style: TextStyle(color: Colors.white)))))
        ]));
  }
}