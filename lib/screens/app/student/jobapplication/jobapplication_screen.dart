import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/student/jobapplication/jobapplication_app_bar.dart';
import 'package:phoenixjobs/screens/app/student/jobapplication/jobapplication_body.dart';

// ignore: use_key_in_widget_constructors
class JobapplicationScreen extends StatefulWidget {
  @override
  State<JobapplicationScreen> createState() => _JobapplicationScreenState();
}

class _JobapplicationScreenState extends State<JobapplicationScreen> {
  bool _isApplyJobDialog = false;
  bool get isApplyJobDialog => _isApplyJobDialog;
  set isApplyJobDialog(v) => _isApplyJobDialog = v;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: JobapplicationAppBar(state: this),
        body: JobapplicationBody(state: this),
      ),
    );
  }
}
