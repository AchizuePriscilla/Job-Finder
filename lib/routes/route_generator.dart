import 'package:sca_ui/routes/route_names.dart';
import 'package:sca_ui/views/screens/create_job_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sca_ui/views/screens/description_screen.dart';
import 'package:sca_ui/views/screens/job_details_screen.dart';
import 'package:sca_ui/views/screens/login_screen.dart';
import 'package:sca_ui/views/screens/profile_screen.dart';
import 'package:sca_ui/views/screens/register_screen.dart';
import 'package:sca_ui/views/screens/search_jobs_screen.dart';
import 'package:sca_ui/views/screens/start_screen.dart';
import 'package:sca_ui/views/screens/welcome_screen.dart';

class RouteGenerator {
//Routes will be generated with this function
//Therefore all views will be registered here with appropriate page transition
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.startScreen:
        return CupertinoPageRoute(
            builder: (context) => StartScreen(), settings: settings);

        break;
      case RouteNames.createJobScreen:
        return CupertinoPageRoute(
            builder: (context) => CreateJobScreen(), settings: settings);
        break;
      case RouteNames.descriptionScreen:
        return CupertinoPageRoute(
            builder: (context) => DescriptionScreen(), settings: settings);
        break;
      case RouteNames.jobDetailsScreen:
        return CupertinoPageRoute(
            builder: (context) => JobDetailsScreen(), settings: settings);
        break;
      case RouteNames.loginScreen:
        return CupertinoPageRoute(
            builder: (context) => LoginScreen(), settings: settings);
        break;
      case RouteNames.profileScreen:
        return CupertinoPageRoute(
            builder: (context) => ProfileScreen(), settings: settings);
        break;
      case RouteNames.registerScreen:
        return CupertinoPageRoute(
            builder: (context) => RegisterScreen(), settings: settings);
        break;
      case RouteNames.searchJobsScreen:
        return CupertinoPageRoute(
            builder: (context) => SearchJobsScreen(), settings: settings);
        break;
      case RouteNames.welcomeScreen:
        return CupertinoPageRoute(
            builder: (context) => WelcomeScreen(), settings: settings);
        break;

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(
      builder: (context) => Scaffold(
          appBar: AppBar(
              title: Text(
            'Page not found',
            style: TextStyle(color: Colors.red),
          )),
          body: Center(
            child: Text(
              'Error! Page not found',
              style: TextStyle(color: Colors.red),
            ),
          )),
    );
  }
}
