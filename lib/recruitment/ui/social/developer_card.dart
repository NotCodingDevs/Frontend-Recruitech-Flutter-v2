import 'package:flutter/material.dart';

import '../../../profile/data/remote/models/developer.dart';

class DeveloperCard extends StatelessWidget {
  const DeveloperCard({super.key, required this.developer});

  final Developer developer;

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
                developer.profilePicture,
                height: 64.0,
                width: 64.0,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 24.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${developer.firstName} ${developer.lastName}',
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0C1E38),
                      fontSize: 17.0,
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    developer.occupation,
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
