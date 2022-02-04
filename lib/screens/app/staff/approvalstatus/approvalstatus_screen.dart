import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/staff/approvalstatus/approvalstatus_app_bar.dart';
import 'package:phoenixjobs/screens/app/staff/approvalstatus/approvalstatus_body.dart';

// ignore: use_key_in_widget_constructors
class ApprovalstatusScreen extends StatefulWidget {
  @override
  State<ApprovalstatusScreen> createState() => _ApprovalstatusScreenState();
}

class _ApprovalstatusScreenState extends State<ApprovalstatusScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ApprovalstatusAppBar(state: this),
        body: ApprovalstatusBody(state: this),
      ),
    );
  }
}
