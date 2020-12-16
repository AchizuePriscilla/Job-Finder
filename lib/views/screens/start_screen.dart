import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sca_ui/config.dart';
import 'package:sca_ui/viewmodels/startscreen_viewmodel.dart';
import 'package:sca_ui/widgets/customButton.dart';
import 'package:sca_ui/views/screens/login_screen.dart';
import 'package:sca_ui/views/screens/register_screen.dart';
import 'package:sca_ui/routes/route_names.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartScreenViewModel>.reactive(
        builder: (context, model, child) => SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 10,
                      ),
                      Text(
                        "Have an account already?",
                        style: TextStyle(
                            color: Color(0xff564569),
                            fontSize: SizeConfig.safeBlockHorizontal * 9.5,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: CustomButton(
                              height: SizeConfig.safeBlockVertical * 12,
                              text: "Login",
                              buttonColor: Color(0xff564569),
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteNames.loginScreen);
                              }),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 20,
                      ),
                      Text(
                        "Don't have an account yet?",
                        style: TextStyle(
                            color: Color(0xff564569),
                            fontSize: SizeConfig.safeBlockHorizontal * 9.5,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: CustomButton(
                              height: SizeConfig.safeBlockVertical * 12,
                              text: "Register",
                              buttonColor: Color(0xff564569),
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteNames.registerScreen);
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => StartScreenViewModel());
  }
}
