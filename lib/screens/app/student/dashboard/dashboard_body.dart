// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/student/student_viewmodel.dart';
import 'package:phoenixjobs/screens/app/student/dashboard/job_application_tile.dart';
import 'package:phoenixjobs/screens/app/student/dashboard/job_tile.dart';
import 'package:phoenixjobs/screens/app/student/dashboard/payment_tile.dart';
import 'package:phoenixjobs/screens/app/student/jobapplication/jobapplication_screen.dart';
import 'package:phoenixjobs/screens/app/student/joblist/joblist_screen.dart';
import 'package:phoenixjobs/screens/app/student/payment/payment_screen.dart';
import 'package:phoenixjobs/screens/view.dart';

class DashboardBody extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state;
  // ignore: use_key_in_widget_constructors
  const DashboardBody({this.state});

  void _navigateJobapplicationScreen({context}) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (_) => JobapplicationScreen()));
  }

  void _navigateJoblistScreen({context}) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (_) => JoblistScreen()));
  }

  void _navigatePaymentScreen({context}) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (_) => PaymentScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return View<StudentViewModel>(
      builder: (_, vm, __) {
        // ignore: avoid_print
        print("My print, vm.jobLength: ${vm.jobLength}");
        // ignore: avoid_print
        print("My print, vm.paymentLength: ${vm.paymentLength}");

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
                      offset: const Offset(0, 3), // changes position of shadow
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
                      onPressed: () => _navigateJoblistScreen(context: context),
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
            // Job application
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Job application',
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
            // Job application summary
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3), // changes position of shadow
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
                //job application items
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
                        itemCount: vm.jobApplicationLength > 5
                            ? 5
                            : vm.jobApplicationLength,
                        itemBuilder: (context, index) =>
                            JobApplicationTile(index),
                      ),
                    ),
                  ),
                  // see more button
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      onPressed: () =>
                          _navigateJobapplicationScreen(context: context),
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
            // Review payment
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Review payment',
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
            // Review payment summary
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3), // changes position of shadow
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
                //payment items
                children: <Widget>[
                  Container(
                    // test the border
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.blueAccent)),
                    // padding is necessary, else items will dissappear
                    padding: const EdgeInsets.all(1),
                    child: Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: vm.paymentLength > 5 ? 5 : vm.paymentLength,
                        itemBuilder: (context, index) => PaymentTile(index),
                      ),
                    ),
                  ),
                  // see more button
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      onPressed: () => _navigatePaymentScreen(context: context),
                      child: const Text(
                        "SEE MORE",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
