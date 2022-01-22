import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/student/dashboard/dashboard_app_bar.dart';
import 'package:phoenixjobs/screens/app/student/dashboard/dashboard_body.dart';
import 'package:phoenixjobs/screens/app/student/dashboard/dashboard_drawer.dart';

// ignore: use_key_in_widget_constructors
class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(state: this),
        drawer: DashboardDrawer(state: this),
        body: DashboardBody(state: this),
      ),
    );
  }
}
