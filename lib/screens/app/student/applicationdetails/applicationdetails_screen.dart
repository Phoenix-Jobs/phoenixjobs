import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/student/applicationdetails/applicationdetails_app_bar.dart';
import 'package:phoenixjobs/screens/app/student/applicationdetails/applicationdetails_body.dart';

// ignore: use_key_in_widget_constructors
class ApplicationdetailsScreen extends StatefulWidget {
  @override
  State<ApplicationdetailsScreen> createState() =>
      _ApplicationdetailsScreenScreenState();
}

class _ApplicationdetailsScreenScreenState
    extends State<ApplicationdetailsScreen> {
  bool _isApplyJobDialog = false;
  bool get isApplyJobDialog => _isApplyJobDialog;
  set isApplyJobDialog(v) => _isApplyJobDialog = v;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ApplicationdetailsAppBar(state: this),
        body: ApplicationdetailsBody(state: this),
      ),
    );
  }
}
