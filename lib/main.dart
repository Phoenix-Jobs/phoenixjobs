import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/student/jobdetails/jobdetails_screen.dart';
// import 'package:phoenixjobs/screens/app/auth/auth_screen.dart';
// import 'package:phoenixjobs/screens/app/register/register_screen.dart';
// import 'package:phoenixjobs/screens/app/student/joblist/joblist_screen.dart';
// import 'package:phoenixjobs/screens/app/welcome/welcome_screen.dart';
// import 'package:phoenixjobs/screens/app/welcome/welcome_screen.dart';
// import all package to load difference screens

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Phoenix Jobs",
    theme: ThemeData(primarySwatch: Colors.deepOrange),
    // loading different home to test different interface
    home: JobdetailsScreen(),
  ));
}
