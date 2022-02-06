// Turn of null-safety by writing the following line
// @dart=2.9

import 'dart:async';

import 'package:phoenixjobs/models/job.dart';
import 'package:phoenixjobs/models/job_application.dart';
import 'package:phoenixjobs/models/user.dart';
import 'package:phoenixjobs/screens/viewmodel.dart';
import 'package:phoenixjobs/services/job/job_service.dart';
import 'package:phoenixjobs/services/jobApplication/job_application_service.dart';
import 'package:phoenixjobs/services/service_locator.dart';
import 'package:phoenixjobs/services/user/user_repository.dart';
import 'package:phoenixjobs/services/user/user_service.dart';

class DashboardViewmodel extends Viewmodel {
  // stream observer initializer
  StreamSubscription _jobStreamObserver;
  StreamSubscription _jobApplicationStreamObserver;
  bool get isObservingJobStream => _jobStreamObserver != null;
  bool get isObservingJobApplicationStream =>
      _jobApplicationStreamObserver != null;
  // user repository initializer
  final UserRepository _userRepository = locator<UserRepository>();
  final UserService _userService = locator<UserService>();
  User get user => _userRepository.user;
  // current user initializer
  User get currentUser => _currentUser;
  User _currentUser;
  // job initializer
  final JobService _jobService = locator<JobService>();
  List<Job> _jobList;
  // job application initializer
  final JobApplicationService _jobApplicationService =
      locator<JobApplicationService>();
  List<JobApplication> _jobApplicationList;
  List<JobApplication> _paymentList;

  // viewmodel onload
  DashboardViewmodel() {
    _userRepository.addListener(() async {
      if (user == null) {
        // if no user, consider dashboard items is nothing
        _jobList = null;
        _jobApplicationList = null;
        _paymentList = null;
      } else {
        init();
      }
      notifyListeners();
    });
  }

  // update init to get data
  @override
  init() async => await update(() async {
        // get current user
        _currentUser = await _userService.getUser(_userRepository.user.uid);

        // get job list
        _jobList = await _jobService.fetchJobs();
        _jobStreamObserver = _jobService.observeStream(
            onData: (receivedData) async => await update(() async => _jobList =
                (receivedData.docs as List)
                    .map((doc) => Job.fromJson(doc.data()))
                    .toList()),
            // ignore: avoid_print
            onError: (e) => print(e));

        // get job application list
        _jobApplicationList =
            await _jobApplicationService.fetchStudentApplications();
        _jobApplicationStreamObserver = _jobApplicationService.observeStream(
            onData: (receivedData) async => await update(() async =>
                _jobApplicationList = (receivedData.docs as List)
                    .map((doc) => JobApplication.fromJson(doc.data()))
                    .toList()),
            // ignore: avoid_print
            onError: (e) => print(e));

        // super init
        super.init();
      });

  // signout
  Future<void> signOut() async {
    // terminate job stream observer
    _jobStreamObserver?.cancel();
    _jobStreamObserver = null;
    // terminate job application stream observer
    _jobApplicationStreamObserver?.cancel();
    _jobApplicationStreamObserver = null;
    // signout user
    await _userRepository.signOut();
  }

  // dispose
  @override
  void dispose() {
    // terminate job stream observer
    _jobStreamObserver?.cancel();
    _jobStreamObserver = null;
    // terminate job application stream observer
    _jobApplicationStreamObserver?.cancel();
    _jobApplicationStreamObserver = null;
    // super dispose
    super.dispose();
  }
}
