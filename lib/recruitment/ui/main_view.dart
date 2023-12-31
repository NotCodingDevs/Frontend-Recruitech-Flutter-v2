import 'package:flutter/material.dart';
import 'package:frontend_recruitech_flutter_v2/profile/data/remote/services/profile_service.dart';
import 'package:frontend_recruitech_flutter_v2/recruitment/ui/home/home_view.dart';
import 'package:frontend_recruitech_flutter_v2/recruitment/ui/jobs/jobs_view.dart';
import 'package:frontend_recruitech_flutter_v2/recruitment/ui/notifications/notifications_view.dart';
import 'package:frontend_recruitech_flutter_v2/recruitment/ui/social/NetworkView.dart';

import '../../profile/data/remote/models/developer.dart';
import '../../security/data/remote/models/user.dart';
import '../data/models/job.dart';
import '../data/services/job_service.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, required this.currentUser});
  final User currentUser;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  Developer? _currentDeveloper;
  ProfileService? profileService;
  List<Developer>? _currentDevelopers;

  JobService? jobService;
  List<Job>? _currentJobs;

  @override
  void initState() {
    super.initState();
    profileService = ProfileService();
    jobService = JobService();
    initalize();
  }

  void initalize() async {
    _currentDeveloper = Developer.noArgsConstructor();
    _currentJobs = List.empty();
    _currentDevelopers = List.empty();

    _currentDeveloper = await profileService
        ?.fetchDeveloperProfileByUserId(widget.currentUser.id);
    _currentJobs = await jobService?.fetchAllJobs();
    _currentDevelopers = await profileService?.featchAllDevelopers();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeView(
        user: widget.currentUser,
        developer: _currentDeveloper!,
      ),
      NetworkView(
        user: widget.currentUser,
        developers: _currentDevelopers!,
      ),
      JobsView(
        jobs: _currentJobs!,
        developer: _currentDeveloper!,
      ),
      NotificationsView(),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'Network',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}
