import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sca_ui/config.dart';
import 'package:sca_ui/viewmodels/registerscreen_viewmodel.dart';
import 'package:sca_ui/widgets/customButton.dart';
import 'package:sca_ui/constants.dart';
import 'package:sca_ui/views/screens/login_screen.dart';
import 'dart:developer';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterScreenViewModel>.reactive(
        builder: (context, model, child) => SafeArea(
              child: Scaffold(
                backgroundColor: Color(0xff564569),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: ListView(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: SizeConfig.safeBlockVertical * 20,
                          child: Text(
                            'Job\nFinder',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal * 11,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 5,
                        ),
                        TextField(
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: ktextFieldDecoration.copyWith(
                                hintText: 'Enter your Email')),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 1,
                        ),
                        TextField(
                            obscureText: true,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: ktextFieldDecoration.copyWith(
                                hintText: 'Enter your Password')),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 2.5,
                        ),
                        CustomButton(
                          height: SizeConfig.safeBlockVertical * 12,
                          text: 'Register',
                          onPressed: () {
                            log(email);
                            log(password);

                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return LoginScreen();
                            // }));
                          },
                          buttonColor: Colors.deepPurple[300],
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
        viewModelBuilder: () => RegisterScreenViewModel());
  }
}