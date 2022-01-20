import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/welcome/welcome_body.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeBody(state: this, data: ""),
    );
  }
}
