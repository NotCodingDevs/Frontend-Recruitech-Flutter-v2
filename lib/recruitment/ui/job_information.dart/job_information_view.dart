import 'package:flutter/material.dart';

import '../../../shared/ui/theme/text_styles.dart';
import '../../data/models/job.dart';

class JobInformationView extends StatefulWidget {
  const JobInformationView({super.key, required this.job});
  final Job job;

  @override
  State<JobInformationView> createState() => _JobInformationViewState();
}

class _JobInformationViewState extends State<JobInformationView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF8FAFB),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8FAFB),
        title: Text(
          'Detail Job',
          style: TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w700,
              color: Color(0xFF0C1E38)),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: size.height * 0.135,
              child: Container(
                width: size.width,
                height: size.height * 0.865,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0)),
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 48.0,
                    ),
                    Text(
                      widget.job.title,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '${widget.job.company.name} - ${widget.job.company.location.location}',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Gilroy',
                        color: Color(0xFF465468),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.business_center_outlined,
                          size: 18.0,
                          color: Color(0xFF465468),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          widget.job.type,
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                              color: Color(0xFF465468)),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Icon(
                          Icons.monetization_on_outlined,
                          size: 18.0,
                          color: Color(0xFF465468),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          '11000',
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                              color: const Color(0xFF465468)),
                        ),
                      ],
                    ),
                    Divider(
                      height: 56.0,
                      thickness: 1.0,
                      color: Color.fromARGB(255, 190, 194, 201),
                    ),
                    Container(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Job Description',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 17.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0C1E38),
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            widget.job.description,
                            style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                                color: const Color(0xFF465468)),
                          ),
                          SizedBox(
                            height: 18.0,
                          ),
                          Text(
                            'Skills',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 17.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0C1E38),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.05,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'http://192.168.241.55:8080/api/v1/files/images/default_profile.png',
                  height: size.width * 0.25,
                  width: size.width * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.05,
              child: SizedBox(
                width: size.width * 0.9,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 18.0),
                        backgroundColor: Color(0xFF2F4897),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    onPressed: () {},
                    child: Text(
                      'Apply for this Job',
                      style: CustomTextStyle.buttonText,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
