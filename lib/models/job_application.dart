// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:phoenixjobs/models/job.dart';
import 'package:phoenixjobs/models/user.dart';

class JobApplication {
  dynamic id;
  User applicant;
  User recruiter;
  Job selectedJob;
  String dateApply;
  String applicationStatus;
  String paymentStatus;
  String approvalStatus;

  // constructor
  JobApplication({
    this.id = 0,
    required this.applicant,
    required this.recruiter,
    required this.selectedJob,
    this.dateApply = '',
    this.applicationStatus = '',
    this.paymentStatus = '',
    this.approvalStatus = '',
  });

  // copy constructor
  JobApplication.copy(from)
      : this(
          id: from.id,
          applicant: from.applicant,
          recruiter: from.recruiter,
          selectedJob: from.selectedJob,
          dateApply: from.dateApply,
          applicationStatus: from.applicationStatus,
          paymentStatus: from.paymentStatus,
          approvalStatus: from.approvalStatus,
        );

  // extract from json
  JobApplication.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          applicant: User.getApplicantInfo(json['applicant']),
          recruiter: User.getJsonUidAndUsername(json['recruiter']),
          selectedJob: Job.getApplicationInfo(json['selectedJob']),
          dateApply: json['dateApply'],
          applicationStatus: json['applicationStatus'],
          paymentStatus: json['paymentStatus'],
          approvalStatus: json['approvalStatus'],
        );

  // encode to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'applicant': {
          'uid': applicant.uid,
          'username': applicant.username,
          'firstName': applicant.firstName,
          'lastName': applicant.lastName,
          'email': applicant.email,
          'residueAddress': applicant.residueAddress,
          'age': applicant.age,
          'gender': applicant.gender,
        },
        'recruiter': {
          'uid': applicant.uid,
          'username': applicant.username,
        },
        'selectedJob': {
          'id': selectedJob.id,
          'imagePath': selectedJob.imagePath,
          'title': selectedJob.title,
          'recruiter': {
            'uid': applicant.uid,
            'username': applicant.username,
          },
          'venue': selectedJob.venue,
        },
        'dateApply': dateApply,
        'applicationStatus': applicationStatus,
        'paymentStatus': paymentStatus,
        'approvalStatus': approvalStatus,
      };

  // copywith
  JobApplication copyWith({
    id,
    User? applicant,
    User? recruiter,
    Job? selectedJob,
    dateApply,
    applicationStatus,
    paymentStatus,
    approvalStatus,
  }) =>
      JobApplication(
        id: id ?? this.id,
        applicant: applicant ?? this.applicant,
        recruiter: recruiter ?? this.recruiter,
        selectedJob: selectedJob ?? this.selectedJob,
        dateApply: dateApply ?? this.dateApply,
        applicationStatus: applicationStatus ?? this.applicationStatus,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        approvalStatus: approvalStatus ?? this.approvalStatus,
      );
}
