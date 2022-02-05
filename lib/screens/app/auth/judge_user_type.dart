// ignore_for_file: import_of_legacy_library_into_null_safe, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/auth/judge_user_type_viewmodel.dart';
import 'package:phoenixjobs/screens/app/staff/staff_dashboard/staff_dashboard_screen.dart';
import 'package:phoenixjobs/screens/app/student/dashboard/dashboard_screen.dart';
import 'package:phoenixjobs/screens/view.dart';

class JudgeUserType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return View<JudgeUserTypeViewmodel>(
      builder: (_, vm, __) => vm.currentUser.status == 'Student'
          ? DashboardScreen()
          : StaffDashboardScreen(),
    );
  }
}
