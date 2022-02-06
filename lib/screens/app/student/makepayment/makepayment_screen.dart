import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/student/makepayment/makepayment_app_bar.dart';
import 'package:phoenixjobs/screens/app/student/makepayment/makepayment_body.dart';

// ignore: use_key_in_widget_constructors
class MakepaymentScreen extends StatefulWidget {
  @override
  State<MakepaymentScreen> createState() => _MakepaymentScreenState();
}

class _MakepaymentScreenState extends State<MakepaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MakepaymentAppBar(state: this),
        body: MakepaymentBody(state: this),
      ),
    );
  }
}
