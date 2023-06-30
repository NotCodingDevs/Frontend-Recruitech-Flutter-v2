import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:frontend_recruitech_flutter_v2/profile/data/remote/models/developer.dart';
import 'package:frontend_recruitech_flutter_v2/profile/ui/developer_profile/developer_profile_view.dart';
import 'package:frontend_recruitech_flutter_v2/recruitment/ui/jobs/widgets/feature_job_card.dart';

import '../../../security/data/remote/models/user.dart';
import '../../data/models/job.dart';
import '../../data/services/job_service.dart';
import '../job_information.dart/job_information_view.dart';
import '../jobs/widgets/job_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.developer, required this.user});
  final User user;
  final Developer developer;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Job>? featuredJobs;
  List<Job>? recommendedJobs;
  JobService? jobService;

  @override
  void initState() {
    super.initState();
    Navigator.popUntil(context, (route) => route.isFirst);
    jobService = JobService();
    initalize();
  }

  void initalize() async {
    featuredJobs = List.empty();
    recommendedJobs = List.empty();
    featuredJobs = await jobService?.fetchAllFeaturedJobs();
    recommendedJobs = await jobService?.fetchAllRecommendJobs();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    jobService;
    recommendedJobs;
    featuredJobs;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                        builder: (context) => DeveloperProfileView(
                            user: widget.user, developer: widget.developer))),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 28.0,
                      child: CircleAvatar(
                        radius: 26.0,
                        backgroundImage:
                            NetworkImage(widget.developer.profilePicture),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                'Featured Jobs',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0C1E38),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: featuredJobs!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          Job? res = await Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => JobInformationView(
                                        job: featuredJobs![index],
                                        developerId: widget.developer.id,
                                      )));

                          if (res != null) {
                            await Flushbar(
                              flushbarPosition: FlushbarPosition.TOP,
                              title: 'Hey ${widget.developer.firstName}',
                              message:
                                  'You just applied for the job of ${featuredJobs![index].title} in ${featuredJobs![index].company.name}',
                              duration: Duration(seconds: 5),
                            ).show(context);
                          }
                        },
                        child: FeatureJobCard(job: featuredJobs![index]),
                      );
                    }),
              ),
              Text(
                'Recommended For You',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0C1E38),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: recommendedJobs!.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () async {
                        Job? res =
                            await Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => JobInformationView(
                                      job: recommendedJobs![index],
                                      developerId: widget.developer.id,
                                    )));

                        if (res != null) {
                          await Flushbar(
                            flushbarPosition: FlushbarPosition.TOP,
                            title: 'Hey ${widget.developer.firstName}',
                            message:
                                'You just applied for the job of ${recommendedJobs![index].title} in ${recommendedJobs![index].company.name}',
                            duration: Duration(seconds: 5),
                          ).show(context);
                        }
                      },
                      child: JobCard(job: recommendedJobs![index]),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
