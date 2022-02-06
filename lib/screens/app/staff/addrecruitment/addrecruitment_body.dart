// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:phoenixjobs/models/job.dart';
import 'package:phoenixjobs/models/user.dart';
import 'package:phoenixjobs/screens/app/student/student_viewmodel.dart';
import 'package:phoenixjobs/screens/view.dart';

class AddrecruitmentBody extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state, index, operation;
  // ignore: use_key_in_widget_constructors
  const AddrecruitmentBody({this.state, this.index, this.operation});

  @override
  Widget build(BuildContext context) {
    return SelectorView<StudentViewModel, Job>(
      selector: (_, vm) => vm.getRecruitJob(index),
      builder: (_, vm, job, ___) {
        print('my print, operation: $operation');
        return Form(
          key: state.recruitmentFormKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              // jobtitle
              if (operation == 'add')
                TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Job Title',
                  ),
                  controller: state.jobTitleController..text = '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
                    }
                    return null;
                  },
                ),
              if (operation == 'update')
                TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Job Title',
                  ),
                  controller: state.jobTitleController..text = job.title,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
                    }
                    return null;
                  },
                ),
              const SizedBox(height: 20),
              // jobtitle

              if (operation == 'add')
                TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Venue',
                  ),
                  controller: state.venueController..text = '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
                    }
                    return null;
                  },
                ),
              if (operation == 'update')
                TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Venue',
                  ),
                  controller: state.venueController..text = job.venue,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
                    }
                    return null;
                  },
                ),
              const SizedBox(height: 20),
              // upload title image button
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.8,
                height: 60,
                color: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {},
                child: const Text(
                  "UPLOAD IMAGE",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // uploaded image tag
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'example.jpg',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "DELETE",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
              // job Highlights
              if (operation == 'add')
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Job Information',
                  ),
                  controller: state.jobHighlightsController..text = '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
                    }
                    return null;
                  },
                ),
              if (operation == 'update')
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Job Information',
                  ),
                  controller: state.jobHighlightsController
                    ..text = job.jobHighlights,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
                    }
                    return null;
                  },
                ),
              const SizedBox(height: 20),
              // Job Responsibilities
              if (operation == 'add')
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Job Responsibilities',
                  ),
                  controller: state.jobResponsibilitiesController..text = '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
                    }
                    return null;
                  },
                ),
              if (operation == 'update')
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Job Responsibilities',
                  ),
                  controller: state.jobResponsibilitiesController
                    ..text = job.jobResponsibilities,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
                    }
                    return null;
                  },
                ),
              const SizedBox(height: 20),
              // career level
              if (operation == 'add')
                TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Career Level',
                  ),
                  controller: state.careerLevelController..text = '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
                    }
                    return null;
                  },
                ),
              if (operation == 'update')
                TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Career Level',
                  ),
                  controller: state.careerLevelController
                    ..text = job.careerLevel,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
                    }
                    return null;
                  },
                ),
              const SizedBox(height: 20),
              // Job Specialization
              if (operation == 'add')
                TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Job Specialization',
                  ),
                  controller: state.jobSpecController..text = '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
                    }
                    return null;
                  },
                ),
              if (operation == 'update')
                TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Job Specialization',
                  ),
                  controller: state.jobSpecController..text = job.jobSpec,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
                    }
                    return null;
                  },
                ),
              const SizedBox(height: 20),
              // Working hour
              if (operation == 'add')
                TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Working Hour',
                  ),
                  controller: state.workingHourController..text = '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
                    }
                    return null;
                  },
                ),
              if (operation == 'update')
                TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Working Hour',
                  ),
                  controller: state.workingHourController
                    ..text = job.workingHour,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
                    }
                    return null;
                  },
                ),
              const SizedBox(height: 20),
              // working time
              if (operation == 'add')
                TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Working Time',
                  ),
                  controller: state.workingTimeController..text = '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
                    }
                    return null;
                  },
                ),
              if (operation == 'update')
                TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Working Time',
                  ),
                  controller: state.workingTimeController
                    ..text = job.workingTime,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
                    }
                    return null;
                  },
                ),
              const SizedBox(height: 20),
              // add recruitment button
              if (operation == 'add')
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  color: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    if (state.recruitmentFormKey.currentState.validate()) {
                      // If the form is valid, add new job recruitment
                      final dateToday = DateTime.now();
                      String strDateToday =
                          DateFormat('d MMM yyyy').format(dateToday);
                      Job newJob = Job(
                        careerLevel: state.careerLevelController.text,
                        datePost: strDateToday,
                        jobHighlights: state.jobHighlightsController.text,
                        jobResponsibilities:
                            state.jobResponsibilitiesController.text,
                        jobSpec: state.jobSpecController.text,
                        recruiter: User(
                          uid: vm.currentUser.uid,
                          username: vm.currentUser.username,
                        ),
                        title: state.jobTitleController.text,
                        venue: state.venueController.text,
                        workingHour: state.workingHourController.text,
                        workingTime: state.workingTimeController.text,
                      );
                      vm.addJob(newJob);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    "ADD RECRUITMENT",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              if (operation == 'update')
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  color: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    if (state.recruitmentFormKey.currentState.validate()) {
                      // If the form is valid, update job recruitment
                      job.title = state.jobTitleController.text;
                      job.venue = state.venueController.text;
                      job.jobHighlights = state.jobHighlightsController.text;
                      job.jobResponsibilities =
                          state.jobResponsibilitiesController.text;
                      job.careerLevel = state.careerLevelController.text;
                      job.jobSpec = state.jobSpecController.text;
                      job.workingHour = state.workingHourController.text;
                      job.workingTime = state.workingTimeController.text;
                      vm.updateRecruitJob(id: job.id, data: job);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    "UPDATE RECRUITMENT",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
