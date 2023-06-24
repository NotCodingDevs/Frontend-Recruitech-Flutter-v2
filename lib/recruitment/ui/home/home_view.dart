import 'package:flutter/material.dart';
import 'package:frontend_recruitech_flutter_v2/recruitment/ui/profile/profile_view.dart';

import '../../../security/data/remote/models/user.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.user});

  final User user;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProfileView());
  }
}
