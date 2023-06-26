import 'package:flutter/material.dart';

import '../../../data/remote/models/experience.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key, required this.experience});
  final Experience experience;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      color: Color(0xFFF8FAFB),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
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
              SizedBox(
                width: 24.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience.title,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF465468),
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    experience.company.name,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF465468),
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    experience.company.location.location,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
