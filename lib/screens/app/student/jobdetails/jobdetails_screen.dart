import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/student/jobdetails/jobdetails_app_bar.dart';
import 'package:phoenixjobs/screens/app/student/jobdetails/jobdetails_body.dart';

// ignore: use_key_in_widget_constructors
class JobdetailsScreen extends StatefulWidget {
  final int _index;
  final String _operation;
  int get index => _index;
  String get operation => _operation;
  // ignore: use_key_in_widget_constructors
  const JobdetailsScreen({index, operation})
      : _index = index,
        _operation = operation;

  @override
  State<JobdetailsScreen> createState() => _JobdetailsScreenState();
}

class _JobdetailsScreenState extends State<JobdetailsScreen> {
  // bool _isApplyJobDialog = false;
  // bool get isApplyJobDialog => _isApplyJobDialog;
  // set isApplyJobDialog(v) => _isApplyJobDialog = v;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: JobdetailsAppBar(state: this, index: widget.index),
        body: JobdetailsBody(
            state: this, index: widget.index, operation: widget.operation),
      ),
    );
  }
}
