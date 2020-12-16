import 'package:flutter/material.dart';
import 'package:sca_ui/viewmodels/jobdetailsscreen_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:sca_ui/config.dart';

class JobDetailsScreen extends StatefulWidget {
  @override
  _JobDetailsScreenState createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JobDetailsScreenViewModel>.reactive(
        builder: (context, model, child) => SafeArea(
              child: Scaffold(
                backgroundColor: Color(0xff564569),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => JobDetailsScreenViewModel());
  }
}
