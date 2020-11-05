import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sca_ui/config.dart';
import 'package:sca_ui/viewmodels/welcomescreen_viewmodel.dart';
import 'package:sca_ui/widgets/customImageContainer.dart';
import 'package:sca_ui/views/screens/description_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ViewModelBuilder<WelcomeScreenViewModel>.reactive(
        onModelReady: (model) => model.loadPhoto(),
        builder: (context, model, child) => Scaffold(
              body: SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.white38,
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImageContainer(
                          height: SizeConfig.safeBlockVertical * 28,
                          width: SizeConfig.safeBlockHorizontal * 53,
                          url:
                              "https://turkishlaborlaw.com/wp-content/uploads/2016/10/private-employment-agency-regulation-in-turkey.jpg",
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 9.5,
                        ),
                        Text(
                          'Get The Job That You Dream Of',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff564569),
                              fontSize: SizeConfig.safeBlockHorizontal * 9.5,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 5,
                        ),
                        Text(
                          'Just some random text. Mind\'s foggy, can\'t come up with something meaningful',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff818181),
                              fontSize: SizeConfig.safeBlockHorizontal * 5.5),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DescriptionScreen();
                            }));
                          },
                          height: SizeConfig.safeBlockVertical * 12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 30,
                          textColor: Colors.white,
                          color: Color(0xff564569),
                          child: Text(
                            'Start',
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 5.5),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => WelcomeScreenViewModel());
  }
}

// Container(
//                         width: double.infinity,
//                         height: 550,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.grey,
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage(model.imageLink),
//                           ),
//                         ),
//                       ),
