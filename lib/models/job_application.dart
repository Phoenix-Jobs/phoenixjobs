// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:phoenixjobs/models/job.dart';
import 'package:phoenixjobs/models/user.dart';

class JobApplication {
  dynamic id;
  User applicant;
  Job selectedJob;
  String dateApply;
  String paymentStatus;
  String approvalStatus;
  bool isPayment;
  bool isApproval;
  bool isViewResult;

  // constructor
  JobApplication({
    this.id = 0,
    required this.applicant,
    required this.selectedJob,
    this.dateApply = '',
    this.paymentStatus = '',
    this.approvalStatus = '',
    this.isPayment = false,
    this.isApproval = false,
    this.isViewResult = false,
  });

  // copy constructor
  JobApplication.copy(from)
      : this(
          id: from.id,
          applicant: from.applicant,
          selectedJob: from.selectedJob,
          dateApply: from.dateApply,
          paymentStatus: from.paymentStatus,
          approvalStatus: from.approvalStatus,
          isPayment: from.isPayment,
          isApproval: from.isApproval,
          isViewResult: from.isViewResult,
        );

  // extract from json
  JobApplication.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          applicant: User.getApplicantInfo(json['applicant']),
          selectedJob: Job.getApplicationInfo(json['selectedJob']),
          dateApply: json['dateApply'],
          paymentStatus: json['paymentStatus'],
          approvalStatus: json['approvalStatus'],
          isPayment: json['isPayment'],
          isApproval: json['isApproval'],
          isViewResult: json['isViewResult'],
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
        'selectedJob': {
          'id': selectedJob.id,
          'imagePath': selectedJob.imagePath,
          'title': selectedJob.title,
          'recruiter': {
            'uid': selectedJob.recruiter.uid,
            'username': selectedJob.recruiter.username,
          },
          'venue': selectedJob.venue,
        },
        'dateApply': dateApply,
        'paymentStatus': paymentStatus,
        'approvalStatus': approvalStatus,
        'isPayment': isPayment,
        'isApproval': isApproval,
        'isViewResult': isViewResult,
      };

  // copywith
  JobApplication copyWith({
    id,
    User? applicant,
    Job? selectedJob,
    dateApply,
    paymentStatus,
    approvalStatus,
    isPayment,
    isApproval,
    isViewResult,
  }) =>
      JobApplication(
        id: id ?? this.id,
        applicant: applicant ?? this.applicant,
        selectedJob: selectedJob ?? this.selectedJob,
        dateApply: dateApply ?? this.dateApply,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        approvalStatus: approvalStatus ?? this.approvalStatus,
        isPayment: isPayment ?? this.isPayment,
        isApproval: isApproval ?? this.isApproval,
        isViewResult: isViewResult ?? this.isViewResult,
      );
}
