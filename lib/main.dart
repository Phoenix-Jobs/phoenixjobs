import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/welcome/welcome_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Phoenix Jobs",
    theme: ThemeData(primarySwatch: Colors.deepOrange),
    home: WelcomeScreen(),
  ));
}
