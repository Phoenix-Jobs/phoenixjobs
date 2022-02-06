import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/staff/recruitment/recruitment_app_bar.dart';
import 'package:phoenixjobs/screens/app/staff/recruitment/recruitment_body.dart';
import 'package:phoenixjobs/screens/app/staff/recruitment/recruitment_float.dart';

// ignore: use_key_in_widget_constructors
class RecruitmentScreen extends StatefulWidget {
  @override
  State<RecruitmentScreen> createState() => _RecruitmentScreenState();
}

class _RecruitmentScreenState extends State<RecruitmentScreen> {
  bool _isApplyJobDialog = false;
  bool get isApplyJobDialog => _isApplyJobDialog;
  set isApplyJobDialog(v) => _isApplyJobDialog = v;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: RecruitmentAppBar(state: this),
        body: RecruitmentBody(state: this),
        floatingActionButton: RecruitmentFloat(state: this),
      ),
    );
  }
}
