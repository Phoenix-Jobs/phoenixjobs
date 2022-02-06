// @dart=2.9

import 'dart:async';

import 'package:phoenixjobs/models/job_application.dart';
import 'package:phoenixjobs/models/user.dart';
import 'package:phoenixjobs/services/service_locator.dart';
import 'package:phoenixjobs/services/user/user_repository.dart';

abstract class JobApplicationService {
  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;

  Future<List<JobApplication>> fetchJobApplications();
  Future<List<JobApplication>> fetchStudentApplications();
  Future<List<JobApplication>> fetchStaffApprovals();
  Future<JobApplication> getJobApplication(id);
  Future<JobApplication> updateJobApplication({id, JobApplication data});
  Future<void> removeJobApplication(id);
  Future<JobApplication> addJobApplication(JobApplication data);

  // this getter is to be overidden, if the service supports stream such as firestore
  Stream get stream => null;

  StreamSubscription observeStream({
    Function(dynamic) onData,
    Function onError,
    Function onDone,
  }) {
    if (stream == null) return null;
    // in case the service also supports stream (like firestore), prepare a listener
    return stream.listen(onData, onError: onError, onDone: onDone);
  }
}
