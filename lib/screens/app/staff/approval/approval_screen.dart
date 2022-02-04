import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/staff/approval/approval_app_bar.dart';
import 'package:phoenixjobs/screens/app/staff/approval/approval_body.dart';

// ignore: use_key_in_widget_constructors
class ApprovalScreen extends StatefulWidget {
  @override
  State<ApprovalScreen> createState() => _ApprovalScreenState();
}

class _ApprovalScreenState extends State<ApprovalScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ApprovalAppBar(state: this),
        body: ApprovalBody(state: this),
      ),
    );
  }
}
