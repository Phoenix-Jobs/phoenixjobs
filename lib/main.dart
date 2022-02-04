import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/staff/approval/approval_screen.dart';
import 'package:phoenixjobs/screens/app/welcome/welcome_screen.dart';
import 'package:phoenixjobs/service_locator/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeServiceLocator();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Phoenix Jobs",
    theme: ThemeData(primarySwatch: Colors.deepOrange),
    // loading different home to test different interface
    home: ApprovalScreen(),
  ));
}
