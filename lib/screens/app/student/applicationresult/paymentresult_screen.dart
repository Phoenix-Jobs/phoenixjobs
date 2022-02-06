import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/student/applicationresult/paymentresult_app_bar.dart';
import 'package:phoenixjobs/screens/app/student/applicationresult/paymentresult_body.dart';

// ignore: use_key_in_widget_constructors
class ApplicationresultScreen extends StatefulWidget {
  @override
  State<ApplicationresultScreen> createState() =>
      _ApplicationresultScreenState();
}

class _ApplicationresultScreenState extends State<ApplicationresultScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ApplicationresultAppBar(state: this),
        body: ApplicationresultBody(state: this),
      ),
    );
  }
}
