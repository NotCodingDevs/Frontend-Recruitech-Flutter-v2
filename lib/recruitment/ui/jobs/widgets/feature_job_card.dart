import 'package:flutter/material.dart';

import '../../../data/models/job.dart';

class FeatureJobCard extends StatelessWidget {
  const FeatureJobCard({super.key, required this.job});
  final Job job;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: Colors.indigo,
      margin: EdgeInsets.only(right: 10.0),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                job.company.profilePicture,
                height: 64.0,
              ),
              SizedBox(
                width: 24.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    job.title,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 17.0,
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    '${job.company.name} - ${job.company.location.location}',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.business_center_outlined,
                        size: 18.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        job.type,
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Icon(
                        Icons.monetization_on_outlined,
                        size: 18.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        job.renumeration,
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Colors.white),
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
