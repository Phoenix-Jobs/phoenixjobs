import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/student/applicationdetails/applicationdetails_app_bar.dart';
import 'package:phoenixjobs/screens/app/student/applicationdetails/applicationdetails_body.dart';

// ignore: use_key_in_widget_constructors
class ApplicationdetailsScreen extends StatefulWidget {
  final int _index;
  int get index => _index;
  // ignore: use_key_in_widget_constructors
  const ApplicationdetailsScreen({index}) : _index = index;

  @override
  State<ApplicationdetailsScreen> createState() =>
      _ApplicationdetailsScreenScreenState();
}

class _ApplicationdetailsScreenScreenState
    extends State<ApplicationdetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ApplicationdetailsAppBar(state: this, index: widget.index),
        body: ApplicationdetailsBody(state: this, index: widget.index),
      ),
    );
  }
}
