import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/student/joblist/joblist_app_bar.dart';
import 'package:phoenixjobs/screens/app/student/joblist/joblist_body.dart';

// ignore: use_key_in_widget_constructors
class JoblistScreen extends StatefulWidget {
  @override
  State<JoblistScreen> createState() => _JoblistScreenState();
}

class _JoblistScreenState extends State<JoblistScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: JoblistAppBar(state: this),
        body: JoblistBody(state: this),
      ),
    );
  }
}
