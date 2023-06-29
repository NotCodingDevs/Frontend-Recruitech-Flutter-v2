import 'package:flutter/material.dart';

import '../../../data/models/job.dart';

class JobCard extends StatefulWidget {
  const JobCard({super.key, required this.job});
  final Job job;

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: Color(0xFFF8FAFB),
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                'http://192.168.241.55:8080/api/v1/files/images/default_profile.png',
                height: 64.0,
              ),
              const SizedBox(
                width: 24.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.job.title,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0C1E38),
                      fontSize: 17.0,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    '${widget.job.company.name} - ${widget.job.company.location.location}',
                    style: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF465468),
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.business_center_outlined,
                        size: 18.0,
                        color: Color(0xFF465468),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        widget.job.type,
                        style: const TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Color(0xFF465468)),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      const Icon(
                        Icons.monetization_on_outlined,
                        size: 18.0,
                        color: Color(0xFF465468),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      const Text(
                        '11000',
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Color(0xFF465468)),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
