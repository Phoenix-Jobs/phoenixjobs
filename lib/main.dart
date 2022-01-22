import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/welcome/welcome_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Phoenix Jobs",
    theme: ThemeData(primarySwatch: Colors.deepOrange),
    // loading different home to test different interface
    home: const WelcomeScreen(),
  ));
}
