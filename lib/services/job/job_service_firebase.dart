// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phoenixjobs/models/job.dart';
import 'package:phoenixjobs/services/firebase.dart';
import 'package:phoenixjobs/services/job/job_service.dart';
import 'package:uuid/uuid.dart';

class JobServiceFirebase extends JobService {
  final _uuid = Uuid();
  final _firestore = Firestore();

  CollectionReference get _collection => _firestore.collection('jobs');

  Query get _collectionById =>
      _firestore.collection('jobs').where('recruiter.uid', isEqualTo: user.uid);

  DocumentReference _getNumberDocument(jobId) =>
      _firestore.document('jobs/$jobId');

  @override
  Future<List<Job>> fetchJobs() async {
    final snapshot = await _collection.get();
    return snapshot.docs.map((doc) {
      final job = Job.fromJson(doc.data()).copyWith(id: doc.id);
      return job;
    }).toList();
  }

  @override
  Future<List<Job>> fetchRecruiterJobs() async {
    final snapshot = await _collectionById.get();
    return snapshot.docs.map((doc) {
      final job = Job.fromJson(doc.data()).copyWith(id: doc.id);
      return job;
    }).toList();
  }

  @override
  Future<Job> getJob(id) async {
    final doc = await _getNumberDocument(id).get();
    return Job.fromJson(doc.data());
  }

  @override
  Future<Job> updateJob({id, Job data}) async {
    final updatedData = data.copyWith(id: id);
    await _getNumberDocument(id).update(updatedData.toJson());
    return updatedData;
  }

  @override
  Future<void> removeJob(id) async {
    await _getNumberDocument(id).delete();
  }

  @override
  Future<Job> addJob(Job data) async {
    final _id = _uuid.v1();
    final _data = data.copyWith(id: _id);
    await _collection.doc(_id).set(_data.toJson());
    return _data;
  }
}
