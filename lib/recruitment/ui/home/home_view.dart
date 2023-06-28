import 'package:flutter/material.dart';
import 'package:frontend_recruitech_flutter_v2/profile/data/remote/models/developer.dart';
import 'package:frontend_recruitech_flutter_v2/profile/ui/developer_profile/developer_profile_view.dart';

import '../../../security/data/remote/models/user.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.developer});

  final Developer developer;

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: SafeArea(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recruitech',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0C1E38),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            DeveloperProfileView(developer: widget.developer))),
                    child: CircleAvatar(
                      radius: 28.0,
                      backgroundImage:
                          NetworkImage(widget.developer.profilePicture),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const <Widget>[
          Text('FeaturedJob'),
          Column(
            children: [
              Text('AcmeCompany'),
            ],
          ),
          Text('Recommend For you'),
          Column(
            children: [
              Text('AcmeCompany'),
            ],
          ),
        ],
      ),
    );
  }
}
