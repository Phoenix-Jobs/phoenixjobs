import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/student/applicationresult/applicationresult_app_bar.dart';
import 'package:phoenixjobs/screens/app/student/applicationresult/applicationresult_body.dart';

// ignore: use_key_in_widget_constructors
class ApplicationresultScreen extends StatefulWidget {
  final int _index;
  int get index => _index;
  // ignore: use_key_in_widget_constructors
  const ApplicationresultScreen({index}) : _index = index;

  @override
  State<ApplicationresultScreen> createState() =>
      _ApplicationresultScreenState();
}

class _ApplicationresultScreenState extends State<ApplicationresultScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ApplicationresultAppBar(state: this, index: widget.index),
        body: ApplicationresultBody(state: this, index: widget.index),
      ),
    );
  }
}
