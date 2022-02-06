// @dart=2.9

import 'dart:async';

import 'package:phoenixjobs/models/job.dart';
import 'package:phoenixjobs/models/user.dart';
import 'package:phoenixjobs/services/service_locator.dart';
import 'package:phoenixjobs/services/user/user_repository.dart';

abstract class JobService {
  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;

  Future<List<Job>> fetchJobs();
  Future<List<Job>> fetchRecruiterJobs();
  Future<Job> getJob(id);
  Future<Job> updateJob({id, Job data});
  Future<void> removeJob(id);
  Future<Job> addJob(Job data);

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
