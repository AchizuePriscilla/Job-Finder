import 'package:flutter/material.dart';
import 'package:sca_ui/viewmodels/profilescreen_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:sca_ui/config.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileScreenViewModel>.reactive(
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
        viewModelBuilder: () => ProfileScreenViewModel());
  }
}
