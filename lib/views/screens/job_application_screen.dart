import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:sca_ui/models/jobs.dart';
import 'package:sca_ui/viewmodels/base_model.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

class JobApplicationScreen extends StatelessWidget {
  final Jobs jobs;
  String docid = Uuid().v4();

  JobApplicationScreen({Key key, this.jobs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
      viewModelBuilder: () => BaseModel(),
      builder: (_, model, __) => Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrangeAccent[400],
          onPressed: () async {
            model.setBusy(true);
            final Email email = Email(
              subject: 'Re - Job application',
              body: 'Add your message and attachments',
              cc: [jobs.email],
              recipients: [jobs.email],
              isHTML: false,
            );
            await FirebaseFirestore.instance
                .collection('jobs_applied')
                .doc(FirebaseAuth.instance.currentUser.uid)
                .collection('list')
                .doc(docid)
                .set({
              'jobTitle': jobs.jobTitle,
              'jobResponsibilities': jobs.jobResponsibilities,
              'jobLocation': jobs.jobLocation,
              'pay': jobs.pay,
              'email': jobs.email,
            });
            await FlutterEmailSender.send(email);
            model.setBusy(false);
            Navigator.pop(context);
          },
          child: Icon(Icons.add_to_photos),
        ),
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.deepOrangeAccent[400],
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    Icons.all_inclusive,
                    color: Colors.deepOrangeAccent[400],
                    size: 50,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                jobs.jobTitle ?? '',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  fontFamily: 'opensans',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                    ),
                    child: Text(
                      'Description:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'worksans'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                    ),
                    child: Text(
                      jobs?.jobDescription ?? '',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'worksans'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                    ),
                    child: Text(
                      'Job Responsibilities',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'worksans'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                    ),
                    child: Text(
                      jobs.jobResponsibilities ?? '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'worksans',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
