import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/staff/addrecruitment/addrecruitment_app_bar.dart';
import 'package:phoenixjobs/screens/app/staff/addrecruitment/addrecruitment_body.dart';

// ignore: use_key_in_widget_constructors
class AddrecruitmentScreen extends StatefulWidget {
  @override
  State<AddrecruitmentScreen> createState() => _AddrecruitmentScreenState();
}

class _AddrecruitmentScreenState extends State<AddrecruitmentScreen> {
  final recruitmentFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AddrecruitmentAppBar(state: this),
        body: AddrecruitmentBody(state: this),
      ),
    );
  }
}
