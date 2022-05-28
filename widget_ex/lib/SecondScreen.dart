import 'package:flutter/material.dart';

class SecondScreenArguments {
  final String title;
  final String message;

  SecondScreenArguments(this.title, this.message);
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});
  static const routeName = '/second-screen';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as SecondScreenArguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Center(
            child: Column(children: [
          Text(args.message),
          ElevatedButton(
            onPressed: () {
              // Navigate back to first screen when tapped
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          )
        ])));
  }
}
