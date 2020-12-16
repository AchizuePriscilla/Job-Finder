import 'package:flutter/material.dart';
import 'package:sca_ui/viewmodels/createjobscreen_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:sca_ui/config.dart';

class CreateJobScreen extends StatefulWidget {
  @override
  _CreateJobScreenState createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends State<CreateJobScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateJobScreenViewModel>.reactive(
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
        viewModelBuilder: () => CreateJobScreenViewModel());
  }
}
