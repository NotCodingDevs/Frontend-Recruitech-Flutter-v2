import 'package:flutter/material.dart';
import 'package:frontend_recruitech_flutter_v2/recruitment/ui/job_information.dart/job_information_view.dart';
import 'package:frontend_recruitech_flutter_v2/recruitment/ui/jobs/widgets/job_card.dart';
import 'package:frontend_recruitech_flutter_v2/shared/utils/validator.dart';

import '../../../shared/ui/widgets/form_field.dart';
import '../../data/models/job.dart';

class JobsView extends StatefulWidget {
  const JobsView({super.key, required this.jobs});

  final List<Job> jobs;

  @override
  State<JobsView> createState() => _JobsViewState();
}

class _JobsViewState extends State<JobsView> {
  TextEditingController searchController = TextEditingController();
  Validator validator = Validator();

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
                'Mano aca hay chambita mira ',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              CustomTextFormField(
                controller: searchController,
                validator: validator,
                hintText: "Search by Job title",
                icon: Icons.search,
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
                  itemCount: widget.jobs.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                JobInformationView(job: widget.jobs[index])));
                      },
                      child: JobCard(job: widget.jobs[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
