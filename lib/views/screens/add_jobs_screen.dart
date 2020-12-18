import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sca_ui/viewmodels/base_model.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

class AddJobscreen extends StatefulWidget {
  @override
  _AddJobsScreenState createState() => _AddJobsScreenState();
}

class _AddJobsScreenState extends State<AddJobscreen> {
  TextEditingController _jobTitle;
  TextEditingController _jobpay;
  TextEditingController _jobresponsibilities;
  TextEditingController _jobDescription;
  TextEditingController _applicationEmail;
  TextEditingController _jobLocation;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String docid = Uuid().v4();
  List<int> weekItems = [];

  @override
  void initState() {
    super.initState();
    _jobTitle = TextEditingController(
      text: '',
    );
    _jobDescription = TextEditingController(
      text: '',
    );

    _jobpay = TextEditingController(
      text: '',
    );
    _jobresponsibilities = TextEditingController(
      text: '',
    );
    _jobLocation = TextEditingController(
      text: '',
    );
    _applicationEmail = TextEditingController(
      text: '',
    );
  }

  @override
  void dispose() {
    _jobTitle.dispose();
    _jobpay.dispose();
    _jobresponsibilities.dispose();
    _jobLocation.dispose();
    _applicationEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xFFFDF8F8),
            Color(0xFFFFFFFF),
          ],
        ),
      ),
      child: ViewModelBuilder<BaseModel>.reactive(
        viewModelBuilder: () => BaseModel(),
        builder: (_, model, __) => Scaffold(
          backgroundColor: Colors.transparent,
          key: _scaffoldKey,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrangeAccent[400],
            onPressed: () async {
              Pattern pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regex = new RegExp(pattern);
              bool empty = _jobresponsibilities.text.isEmpty ||
                  _applicationEmail.text.isEmpty ||
                  _jobTitle.text.isEmpty ||
                  _jobLocation.text.isEmpty ||
                  _jobDescription.text.isEmpty;
              if (empty) {
                Fluttertoast.showToast(
                  msg: 'Field(s) cannot be empty',
                  backgroundColor: Colors.deepOrangeAccent[400],
                );
              } else {
                if (!regex.hasMatch(_applicationEmail.text)) {
                  Fluttertoast.showToast(msg: 'Invalid email');
                } else {
                  model.setBusy(true);
                  await FirebaseFirestore.instance
                      .collection('jobs')
                      .doc(docid)
                      .set({
                    'jobTitle': _jobTitle.text,
                    'jobResponsibilities': _jobresponsibilities.text,
                    'jobLocation': _jobLocation.text,
                    'pay': _jobpay.text,
                    'email': _applicationEmail.text,
                    'jobDescription': _jobDescription.text,
                  });
                  model.setBusy(false);
                  Navigator.pop(context);
                }
              }
            },
            child: model.busy
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.deepOrangeAccent),
                  )
                : Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF5C5C5C),
                size: 16,
              ),
            ),
            title: Text(
              'New Job',
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _jobTitle,
                      decoration: InputDecoration(
                          hintText: 'Job title', border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _jobpay,
                      decoration: InputDecoration(
                          hintText: 'Job pay', border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _jobLocation,
                      decoration: InputDecoration(
                          hintText: 'Job location',
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _applicationEmail,
                      decoration: InputDecoration(
                          hintText: 'application email',
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _jobDescription,
                      decoration: InputDecoration(
                          hintText: 'Job description',
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _jobresponsibilities,
                      maxLines: 5,
                      decoration: InputDecoration(
                          hintText: 'Job Responsibilities',
                          border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
