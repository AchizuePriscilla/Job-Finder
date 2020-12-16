import 'package:flutter/material.dart';
import 'package:sca_ui/views/screens/create_job_screen.dart';
import 'package:sca_ui/views/screens/description_screen.dart';
import 'package:sca_ui/views/screens/job_details_screen.dart';
import 'package:sca_ui/views/screens/login_screen.dart';
import 'package:sca_ui/views/screens/profile_screen.dart';
import 'package:sca_ui/views/screens/register_screen.dart';
import 'package:sca_ui/views/screens/search_jobs_screen.dart';
import 'package:sca_ui/views/screens/start_screen.dart';
import 'package:sca_ui/views/screens/welcome_screen.dart';

class RouteNames {
  //route names used through out the app will be specified as static constants here

  static const String startScreen = '/';
  static const String createJobScreen = 'CreateJobScreen';
  static const String descriptionScreen = 'DescriptionScreen';
  static const String jobDetailsScreen = 'JobDetailsScreen';
  static const String loginScreen = 'LoginScreen';
  static const String profileScreen = 'ProfileScreen';
  static const String registerScreen = 'RegissterScreen';
  static const String searchJobsScreen = 'SearchJobsScreen';
  static const String welcomeScreen = 'WelcomeScreen';

  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNames.startScreen: (context) => StartScreen(),
    RouteNames.createJobScreen: (context) => CreateJobScreen(),
    RouteNames.descriptionScreen: (context) => DescriptionScreen(),
    RouteNames.jobDetailsScreen: (context) => JobDetailsScreen(),
    RouteNames.loginScreen: (context) => LoginScreen(),
    RouteNames.profileScreen: (context) => ProfileScreen(),
    RouteNames.registerScreen: (context) => RegisterScreen(),
    RouteNames.searchJobsScreen: (context) => SearchJobsScreen(),
    RouteNames.welcomeScreen: (context) => WelcomeScreen(),
  };
}
