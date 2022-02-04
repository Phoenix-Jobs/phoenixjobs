// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/staff/approvalstatus/approvalstatus_screen.dart';
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
    home: ApprovalstatusScreen(),
  ));
}
