// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/staff/recruitment/recruitment_screen.dart';
import 'package:phoenixjobs/screens/app/staff/staff_dashboard/recruitment_tile.dart';
import 'package:phoenixjobs/screens/app/staff/staff_viewmodel.dart';
import 'package:phoenixjobs/screens/app/student/dashboard/job_tile.dart';
import 'package:phoenixjobs/screens/app/student/joblist/joblist_screen.dart';
import 'package:phoenixjobs/screens/app/student/student_viewmodel.dart';
import 'package:phoenixjobs/screens/view.dart';

class StaffDashboardBody extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state;
  // ignore: use_key_in_widget_constructors
  const StaffDashboardBody({this.state});

  void _navigateRecruitmentScreen({context}) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => RecruitmentScreen(),
        ));
  }

  void _navigateJoblistScreen({context}) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => JoblistScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: View<StudentViewModel>(
        builder: (_, vm, __) {
          return ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              // Job list
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Job list',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Job list summary
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    color: Colors.white),
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //job items
                  children: <Widget>[
                    Container(
                      // test the border
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.blueAccent)),
                      // padding is necessary, else items will dissappear
                      padding: const EdgeInsets.all(0),
                      child: Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: vm.jobLength > 5 ? 5 : vm.jobLength,
                          itemBuilder: (context, index) => JobTile(index),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: () =>
                            _navigateJoblistScreen(context: context),
                        child: const Text(
                          "SEE MORE",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              // My recruitments
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'My recruitments',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // My recruitments summary
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    color: Colors.white),
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //job recruitment items
                  children: <Widget>[
                    Container(
                      // test the border
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.blueAccent)),
                      // padding is necessary, else items will dissappear
                      padding: const EdgeInsets.all(0),
                      child: Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: vm.jobRecruitmentLength > 5
                              ? 5
                              : vm.jobRecruitmentLength,
                          itemBuilder: (context, index) =>
                              RecruitmentTile(index),
                        ),
                      ),
                    ),
                    // see more button
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: () =>
                            _navigateRecruitmentScreen(context: context),
                        child: const Text(
                          "SEE MORE",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          );
        },
      ),
    );
  }
}
