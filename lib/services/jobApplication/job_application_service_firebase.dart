// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phoenixjobs/models/job_application.dart';
import 'package:phoenixjobs/services/firebase.dart';
import 'package:phoenixjobs/services/jobApplication/job_application_service.dart';
import 'package:uuid/uuid.dart';

class JobApplicationServiceFirebase extends JobApplicationService {
  final _uuid = Uuid();
  final _firestore = Firestore();

  CollectionReference get _collection =>
      _firestore.collection('jobApplications');

  Query get _collectionByApplicantUid => _firestore
      .collection('jobApplications')
      .where('applicant.uid', isEqualTo: user.uid);

  Query get _collectionByRecruiterUid => _firestore
      .collection('jobApplications')
      .where('recruiter.uid', isEqualTo: user.uid);

  DocumentReference _getNumberDocument(jobApplicationId) =>
      _firestore.document('jobApplications/$jobApplicationId');

  @override
  Future<List<JobApplication>> fetchJobApplications() async {
    final snapshot = await _collection.get();
    return snapshot.docs.map((doc) {
      final jobApplications =
          JobApplication.fromJson(doc.data()).copyWith(id: doc.id);
      return jobApplications;
    }).toList();
  }

  @override
  Future<List<JobApplication>> fetchStudentApplications() async {
    final snapshot = await _collectionByApplicantUid.get();
    return snapshot.docs.map((doc) {
      final studentApplications =
          JobApplication.fromJson(doc.data()).copyWith(id: doc.id);
      return studentApplications;
    }).toList();
  }

  @override
  Future<List<JobApplication>> fetchStaffApprovals() async {
    final snapshot = await _collectionByRecruiterUid.get();
    return snapshot.docs.map((doc) {
      final staffApprovals =
          JobApplication.fromJson(doc.data()).copyWith(id: doc.id);
      return staffApprovals;
    }).toList();
  }

  @override
  Future<JobApplication> getJobApplication(id) async {
    final doc = await _getNumberDocument(id).get();
    return JobApplication.fromJson(doc.data());
  }

  @override
  Future<JobApplication> updateJobApplication({id, JobApplication data}) async {
    final updatedData = data.copyWith(id: id);
    await _getNumberDocument(id).update(updatedData.toJson());
    return updatedData;
  }

  @override
  Future<void> removeJobApplication(id) async {
    await _getNumberDocument(id).delete();
  }

  @override
  Future<JobApplication> addJobApplication(JobApplication data) async {
    final _id = _uuid.v1();
    final _data = data.copyWith(id: _id);
    await _collection.doc(_id).set(_data.toJson());
    return _data;
  }
}
