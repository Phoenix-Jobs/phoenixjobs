import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/welcome/welcome_body.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //body: WelcomeBody(state: this, data: ""),
      body: WelcomeBody(),
    );
  }
}
