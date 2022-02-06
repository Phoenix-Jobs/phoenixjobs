// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/staff/recruitment/recruitment_screen.dart';
import 'package:phoenixjobs/screens/app/staff/staff_dashboard/staff_dashboard_viewmodel.dart';
import 'package:phoenixjobs/screens/view.dart';

class StaffDashboardDrawer extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state;
  // ignore: use_key_in_widget_constructors
  const StaffDashboardDrawer({this.state});

  void _navigateRecruitmentScreen({context}) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => RecruitmentScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return View<StaffDashboardViewmodel>(
      builder: (_, vm, __) {
        return Drawer(
          child: ListView(
            children: <Widget>[
              // header card
              Container(
                decoration: const BoxDecoration(color: Colors.deepOrange),
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // profile image
                    Container(
                      width: 80,
                      height: 80,
                      alignment: Alignment.topLeft,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://images.pexels.com/photos/37347/office-sitting-room-executive-sitting.jpg?cs=srgb&dl=pexels-pixabay-37347.jpg&fm=jpg'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(height: 30),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Name: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: vm.currentUser.firstName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Email: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: vm.currentUser.email,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Logged in as ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: vm.currentUser.status,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text("Dashboard"),
                      onTap: () => Navigator.of(context).pop(),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("My profile"),
                      onTap: () {/* react to the tile being tapped */},
                    ),
                    ListTile(
                      title: const Text("Manage recruitment"),
                      onTap: () {
                        Navigator.of(context).pop();
                        _navigateRecruitmentScreen(context: context);
                      },
                    ),
                    ListTile(
                      title: const Text("Manage approval"),
                      onTap: () {},
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("Logout"),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        vm.signOut();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
