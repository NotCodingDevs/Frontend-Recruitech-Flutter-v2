import 'package:flutter/material.dart';

import '../../../data/remote/models/education.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({super.key, required this.education});

  final Education education;

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
                education.company.profilePicture,
                height: 64.0,
              ),
              SizedBox(
                width: 24.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    education.title,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF465468),
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    education.company.name,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF465468),
                      fontSize: 15.0,
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
