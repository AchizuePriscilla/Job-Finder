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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome_bg.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken),
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
//                  width: 30,
                    height: 25 * SizeConfig.imageSizeMultiplier,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('Images.logo'),
                      ),
                    ),
                  ),
                  Text(
                    "Hello there",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 3.6 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold,
                        fontFamily: "worksans"),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 2.4 * SizeConfig.heightMultiplier),
                    child: Text(
                      "How about a walkthrough the fastest village of job finders",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 1.2 * SizeConfig.textMultiplier,
                        color: Colors.white,
                        fontFamily: "opensans",
                      ),
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: IntrinsicHeight(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteNames.loginScreen);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent[400],
                            borderRadius: BorderRadius.circular(
                                2.0 * SizeConfig.heightMultiplier),
                          ),
                          padding:
                              EdgeInsets.all(1.8 * SizeConfig.heightMultiplier),
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 2.1 * SizeConfig.textMultiplier,
                                fontFamily: "worksans",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 3.6 * SizeConfig.heightMultiplier),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouteNames.registerScreen);
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "opensans",
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 2.4 * SizeConfig.heightMultiplier),
                    child: Text(
                      "By signing in, I hereby agree to Job finder \nterms and condition",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: "opensans",
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

//  @override
//  Widget build(BuildContext context) {
//    return ViewModelBuilder<StartScreenViewModel>.reactive(
//        builder: (context, model, child) => SafeArea(
//              child: Scaffold(
//                body: Padding(
//                  padding: const EdgeInsets.all(16.0),
//                  child: Column(
//                    children: [
//                      SizedBox(
//                        height: SizeConfig.safeBlockVertical * 10,
//                      ),
//                      Text(
//                        "Have an account already?",
//                        style: TextStyle(
//                            color: Color(0xff564569),
//                            fontSize: SizeConfig.safeBlockHorizontal * 9.5,
//                            fontWeight: FontWeight.bold),
//                      ),
//                      SizedBox(
//                        height: SizeConfig.safeBlockVertical * 5,
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(right: 12.0),
//                        child: Container(
//                          alignment: Alignment.centerRight,
//                          child: CustomButton(
//                              height: SizeConfig.safeBlockVertical * 12,
//                              text: "Login",
//                              buttonColor: Color(0xff564569),
//                              textColor: Colors.white,
//                              onPressed: () {
//                                Navigator.pushNamed(
//                                    context, RouteNames.loginScreen);
//                              }),
//                        ),
//                      ),
//                      SizedBox(
//                        height: SizeConfig.safeBlockVertical * 20,
//                      ),
//                      Text(
//                        "Don't have an account yet?",
//                        style: TextStyle(
//                            color: Color(0xff564569),
//                            fontSize: SizeConfig.safeBlockHorizontal * 9.5,
//                            fontWeight: FontWeight.bold),
//                      ),
//                      SizedBox(
//                        height: SizeConfig.safeBlockVertical * 5,
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(right: 12.0),
//                        child: Container(
//                          alignment: Alignment.centerRight,
//                          child: CustomButton(
//                              height: SizeConfig.safeBlockVertical * 12,
//                              text: "Register",
//                              buttonColor: Color(0xff564569),
//                              textColor: Colors.white,
//                              onPressed: () {
//                                Navigator.pushNamed(
//                                    context, RouteNames.registerScreen);
//                              }),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ),
//        viewModelBuilder: () => StartScreenViewModel());
//  }
//}
