import 'package:flutter/material.dart';

class Jobs {
  Jobs(
      {this.jobTitle,
      this.jobResponsibilities,
      this.jobLocation,
      this.pay,
      this.email,
      @required this.jobDescription});

  Jobs.fromJson(Map<String, dynamic> data)
      : jobTitle = data['jobTitle'],
        jobResponsibilities = data['jobResponsibilities'],
        jobLocation = data['jobLocation'],
        pay = data['pay'],
        jobDescription = data['jobDescription'],
        email = data['email'];

  Map<String, dynamic> toJson() {
    return {
      'jobTitle': jobTitle,
      'jobResponsibilities': jobResponsibilities,
      'jobLocation': jobLocation,
      'pay': pay,
      'email': email,
      'jobDescription': jobDescription,
    };
  }

  final String jobTitle,
      jobResponsibilities,
      jobLocation,
      pay,
      email,
      jobDescription;
}
