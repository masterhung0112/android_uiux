import 'package:flutter/material.dart';
import '../../../routes.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '$amazonDefaultRoute/auth-screen';

  AuthScreen({Key? key}): super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("hello")
    );
  }
}