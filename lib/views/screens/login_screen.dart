import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sca_ui/config.dart';
import 'package:sca_ui/viewmodels/loginscreen_viewmodel.dart';
import 'package:sca_ui/widgets/customButton.dart';
import 'package:sca_ui/constants.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginScreenViewModel>.reactive(
        builder: (context, model, child) => SafeArea(
              child: Scaffold(
                backgroundColor: Color(0xff564569),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
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
                          onChanged: (value) {},
                          decoration: ktextFieldDecoration.copyWith(
                              hintText: 'Enter your Email')),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 1,
                      ),
                      TextField(
                          onChanged: (value) {},
                          decoration: ktextFieldDecoration.copyWith(
                              hintText: 'Enter your Password')),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 2.5,
                      ),
                      CustomButton(
                        height: SizeConfig.safeBlockVertical * 12,
                        text: 'Login',
                        onPressed: () {},
                        buttonColor: Colors.deepPurple[300],
                        textColor: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => LoginScreenViewModel());
  }
}
