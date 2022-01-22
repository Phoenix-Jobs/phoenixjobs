import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/staff/staff_dashboard/staff_dashboard_app_bar.dart';
import 'package:phoenixjobs/screens/app/staff/staff_dashboard/staff_dashboard_body.dart';
import 'package:phoenixjobs/screens/app/staff/staff_dashboard/staff_dashboard_drawer.dart';

// ignore: use_key_in_widget_constructors
class StaffDashboardScreen extends StatefulWidget {
  @override
  State<StaffDashboardScreen> createState() => _StaffDashboardScreenState();
}

class _StaffDashboardScreenState extends State<StaffDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: StaffDashboardAppBar(state: this),
        drawer: StaffDashboardDrawer(state: this),
        body: StaffDashboardBody(state: this),
      ),
    );
  }
}
