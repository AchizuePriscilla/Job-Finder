import 'package:flutter/material.dart';
import 'package:sca_ui/viewmodels/searchjobsscreen_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:sca_ui/config.dart';

class SearchJobsScreen extends StatefulWidget {
  @override
  _SearchJobsScreenState createState() => _SearchJobsScreenState();
}

class _SearchJobsScreenState extends State<SearchJobsScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchJobsScreenViewModel>.reactive(
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
        viewModelBuilder: () => SearchJobsScreenViewModel());
  }
}
