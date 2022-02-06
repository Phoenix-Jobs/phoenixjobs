// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:phoenixjobs/models/user.dart';

class Job {
  dynamic id;
  String imagePath;
  String title;
  User recruiter;
  String venue;
  String datePost;
  String jobHighlights;
  String jobResponsibilities;
  String careerLevel;
  String jobSpec;
  String workingHour;
  String workingTime;

  // constructor
  Job({
    this.id = '',
    this.imagePath = '',
    this.title = '',
    required this.recruiter,
    this.venue = '',
    this.datePost = '',
    this.jobHighlights = '',
    this.jobResponsibilities = '',
    this.careerLevel = '',
    this.jobSpec = '',
    this.workingHour = '',
    this.workingTime = '',
  });

  // copy constructor
  Job.copy(from)
      : this(
          id: from.id,
          imagePath: from.imagePath,
          title: from.title,
          recruiter: from.recruiter,
          venue: from.venue,
          datePost: from.datePost,
          jobHighlights: from.jobHighlights,
          jobResponsibilities: from.jobResponsibilities,
          careerLevel: from.careerLevel,
          jobSpec: from.jobSpec,
          workingHour: from.workingHour,
          workingTime: from.workingTime,
        );

  // extract from json
  Job.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          imagePath: json['imagePath'],
          title: json['title'],
          recruiter: User.getJsonUidAndUsername(json['recruiter']),
          venue: json['venue'],
          datePost: json['datePost'],
          jobHighlights: json['jobHighlights'],
          jobResponsibilities: json['jobResponsibilities'],
          careerLevel: json['careerLevel'],
          jobSpec: json['jobSpec'],
          workingHour: json['workingHour'],
          workingTime: json['workingTime'],
        );

  // extract neessary info for job application
  Job.getApplicationInfo(Map<String, dynamic> json)
      : this(
          id: json['id'],
          imagePath: json['imagePath'],
          title: json['title'],
          recruiter: User.getJsonUidAndUsername(json['recruiter']),
          venue: json['venue'],
        );

  // encode to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'imagePath': imagePath,
        'title': title,
        'recruiter': {
          'uid': recruiter.uid,
          'username': recruiter.username,
        },
        'venue': venue,
        'datePost': datePost,
        'jobHighlights': jobHighlights,
        'jobResponsibilities': jobResponsibilities,
        'careerLevel': careerLevel,
        'jobSpec': jobSpec,
        'workingHour': workingHour,
        'workingTime': workingTime,
      };

  // copywith
  Job copyWith({
    id,
    imagePath,
    title,
    User? recruiter,
    venue,
    datePost,
    jobHighlights,
    jobResponsibilities,
    careerLevel,
    jobSpec,
    workingHour,
    workingTime,
  }) =>
      Job(
        id: id ?? this.id,
        imagePath: imagePath ?? this.imagePath,
        title: title ?? this.title,
        recruiter: recruiter ?? this.recruiter,
        venue: venue ?? this.venue,
        datePost: datePost ?? this.datePost,
        jobHighlights: jobHighlights ?? this.jobHighlights,
        jobResponsibilities: jobResponsibilities ?? this.jobResponsibilities,
        careerLevel: careerLevel ?? this.careerLevel,
        jobSpec: jobSpec ?? this.jobSpec,
        workingHour: workingHour ?? this.workingHour,
        workingTime: workingTime ?? this.workingTime,
      );
}
