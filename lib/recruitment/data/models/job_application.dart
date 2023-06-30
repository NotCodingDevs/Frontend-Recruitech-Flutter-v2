import 'job.dart';

class JobApplication {
  String status;
  Job job;

  JobApplication({
    required this.status,
    required this.job,
  });

  factory JobApplication.fromJson(Map<String, dynamic> json) {
    return JobApplication(
      status: json['status'],
      job: Job.fromJson(json['job']),
    );
  }
}
