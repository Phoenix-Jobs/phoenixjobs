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

class StudentViewModel extends Viewmodel {
  // stream observer initializer
  StreamSubscription _jobStreamObserver;
  StreamSubscription _jobApplicationStreamObserver;
  StreamSubscription _jobPaymentStreamObserver;
  bool get isObservingJobStream => _jobStreamObserver != null;
  bool get isObservingJobApplicationStream =>
      _jobApplicationStreamObserver != null;
  bool get isObservingJobPaymentStream => _jobPaymentStreamObserver != null;
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
  // job payment status intializer
  List<JobApplication> _paymentList;

  // viewmodel onload
  StudentViewModel() {
    _userRepository.addListener(() async {
      if (user == null) {
        // if no user, consider dashboard items is nothing
        _jobList = null;
        _paymentList = null;
        _jobApplicationList = null;
      } else {
        init();
      }
      notifyListeners();
    });
  }

  // update init to get data
  @override
  Future<void> init() async => await update(() async {
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

        // get payment list
        _paymentList = await _jobApplicationService.fetchStudentPayments();
        _jobPaymentStreamObserver = _jobApplicationService.observeStream(
            onData: (receivedData) async => await update(() async =>
                _paymentList = (receivedData.docs as List)
                    .map((doc) => JobApplication.fromJson(doc.data()))
                    .toList()),
            // ignore: avoid_print
            onError: (e) => print(e));

        // super init
        super.init();
      });

  // get job list length
  int get jobLength => _jobList == null ? 0 : _jobList.length;
  // get student's job application list length
  int get jobApplicationLength =>
      _jobApplicationList == null ? 0 : _jobApplicationList.length;
  // get student's payment list length
  int get paymentLength => _paymentList == null ? 0 : _paymentList.length;

  // get job item by index
  Job getJob(int i) => _jobList == null ? null : _jobList[i];
  // get job application item by index
  JobApplication getJobApplication(int i) =>
      _jobApplicationList == null ? null : _jobApplicationList[i];
  // get job payment item by index
  JobApplication getPaymentStatus(int i) =>
      _paymentList == null ? null : _paymentList[i];

  // is job application is applied
  bool isJobApplicationApplied(dynamic id) {
    final index = _jobApplicationList
        .indexWhere((jobApplication) => jobApplication.selectedJob.id == id);
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }

  // add job application
  Future<void> addJobApplication(JobApplication jobApplication) async =>
      await update(() async {
        final newJobApplication =
            await _jobApplicationService.addJobApplication(jobApplication);
        _jobApplicationList.add(newJobApplication);
      });

  Future<void> updateJobApplication({dynamic id, JobApplication data}) async =>
      await update(() async {
        // update new data to firebase and assign to variable
        final updatedJobApplication = await _jobApplicationService
            .updateJobApplication(id: id, data: data);
        // get item index from vm list
        final index = _jobApplicationList
            .indexWhere((jobApplication) => jobApplication.id == id);
        // assign updated item into vm list
        _jobApplicationList[index] = updatedJobApplication;
      });

  // signout
  Future<void> signOut() async {
    // terminate job stream observer
    _jobStreamObserver?.cancel();
    _jobStreamObserver = null;
    // terminate job application stream observer
    _jobApplicationStreamObserver?.cancel();
    _jobApplicationStreamObserver = null;
    // terminate job payment stream observer
    _jobPaymentStreamObserver?.cancel();
    _jobPaymentStreamObserver = null;
    // signout user
    await _userRepository.signOut();
  }

  // dispose
  @override
  Future<void> dispose() async {
    // terminate job stream observer
    _jobStreamObserver?.cancel();
    _jobStreamObserver = null;
    // terminate job application stream observer
    _jobApplicationStreamObserver?.cancel();
    _jobApplicationStreamObserver = null;
    // terminate job payment stream observer
    _jobPaymentStreamObserver?.cancel();
    _jobPaymentStreamObserver = null;
    // signout user
    await _userRepository.signOut();
    // super dispose
    super.dispose();
  }
}
