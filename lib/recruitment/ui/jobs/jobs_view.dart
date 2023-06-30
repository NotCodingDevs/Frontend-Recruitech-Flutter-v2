import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:frontend_recruitech_flutter_v2/profile/data/remote/models/developer.dart';
import 'package:frontend_recruitech_flutter_v2/recruitment/data/services/job_service.dart';
import 'package:frontend_recruitech_flutter_v2/recruitment/ui/job_information.dart/job_information_view.dart';
import 'package:frontend_recruitech_flutter_v2/recruitment/ui/jobs/widgets/job_card.dart';
import 'package:frontend_recruitech_flutter_v2/shared/utils/validator.dart';

import '../../../shared/ui/theme/text_styles.dart';
import '../../../shared/ui/widgets/form_field.dart';
import '../../data/models/job.dart';

class JobsView extends StatefulWidget {
  JobsView({super.key, required this.developer, required this.jobs});
  Developer developer;
  List<Job> jobs;

  @override
  State<JobsView> createState() => _JobsViewState();
}

class _JobsViewState extends State<JobsView> {
  TextEditingController searchController = TextEditingController();
  Validator validator = Validator();

  JobService jobService = JobService();
  List<Job>? auxList;

  Future<void> refreshJobs() async {
    List<Job> jobListUpdated = await jobService.fetchAllJobs();

    setState(() {
      auxList = jobListUpdated;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auxList = widget.jobs;
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
          padding: EdgeInsets.only(top: 24.0, right: 24.0, left: 24.0),
          child: RefreshIndicator(
            onRefresh: refreshJobs,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Jobs',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0C1E38),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Find jobs',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 14.0,
                ),
                TextFormField(
                  onChanged: (value) {
                    if (searchController.text.isNotEmpty) {
                      setState(() {
                        auxList = widget.jobs
                            .where((element) => element.title
                                .toLowerCase()
                                .startsWith(
                                    searchController.text.toLowerCase()))
                            .toList();
                      });
                    } else {
                      setState(() {
                        auxList = widget.jobs;
                      });
                    }
                  },
                  controller: searchController,
                  validator: (value) => validator.validateText(value ?? ""),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    hintText: 'Search by Job title',
                    hintStyle: CustomTextStyle.inputPlaceHolder,
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Color(0xFFF8FAFB),
                    prefixIconColor: Color(0xFF8D8D8D),
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
                SizedBox(
                  height: 14.0,
                ),
                const Text(
                  'Suggested Job',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0C1E38),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: auxList!.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () async {
                          Job? res = await Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => JobInformationView(
                                        job: auxList![index],
                                        developerId: widget.developer.id,
                                      )));

                          if (res != null) {
                            await Flushbar(
                              flushbarPosition: FlushbarPosition.TOP,
                              title: 'Hey ${widget.developer.firstName}',
                              message:
                                  'You just applied for the job of ${auxList![index].title} in ${auxList![index].company.name}',
                              duration: Duration(seconds: 5),
                            ).show(context);
                          }
                        },
                        child: JobCard(job: auxList![index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
